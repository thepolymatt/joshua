/*
 * Project Joshua by Polymatt
 * TV Overlay 
 * 
 * A lightweight implementation of volume control with on-screen display
 * Features:
 * - Visual volume bar display
 * - Control Method: Digital POT
 * - Proper volume limits and bounds checking
 * - Visual indicators for current volume level
 * - Memory efficient implementation
 *
 */

//---------------------------------
//--- Libraries
//---------------------------------

#include <TVout.h>
#include <font6x8.h>
#include <EEPROM.h>

//---------------------------------
//--- Debug Control
//---------------------------------

// Debug control
#define DEBUG false  // Set to true to enable Serial debug output

// Debug macros for conditional serial output
#define DEBUG_PRINT(x) \
  if (DEBUG) Serial.print(x)
#define DEBUG_PRINTLN(x) \
  if (DEBUG) Serial.println(x)

//---------------------------------
//--- Definitions
//---------------------------------

// Screen dimensions
#define SCREEN_W 136  // Change from 136 x 96 (standard TVout resolution)
#define SCREEN_H 48

// Volume control constants
#define VOL_MIN 0   // Minimum volume level
#define VOL_MAX 20  // Maximum volume level

#define EEPROM_ADDR_VOLUME 0 // Where to persist the volume
#define EEPROM_ADDR_MUTING 1 // Where to persist the muting state

// Volume bar dimensions (adjusted)
#define VOL_BAR_X 5       // Moved left to allow more width
#define VOL_BAR_Y 10      // Moved up slightly
#define VOL_BAR_WIDTH 54  // 64 - 5(left) - 5(right margin) = 54 max width
#define VOL_BAR_HEIGHT 8  // Reduced height to look proportional

// OSD Settings
#define OSD_DWELL_TIME 1000  // Stays on screen for X milliseconds (unless muted)

//---------------------------------
//--- Digital POT Definitions
//---------------------------------

// MCP4131 Digital Potentiometer pins (output only)
#define POT_CS_PIN 10      // Chip select for digital pot (D10)
#define POT_SCK_PIN 13     // SPI clock (D13)
#define POT_MOSI_PIN 11    // SPI data out (D11)
#define POT_MAX_STEPS 129  // MCP4131 has 129 steps (0-128)

// Debounce delay in milliseconds
#define DEBOUNCE_DELAY 50

TVout tv;

// Volume control variables
int volume = VOL_MAX / 2;  // Current volume (0-100)
int prev_volume = 255;     // Previous volume value to detect changes

// Button control variables
unsigned long last_button_time = OSD_DWELL_TIME * 2;  // Last time a button was pressed
bool display_update_needed = true;                    // Flag to update display
bool osd_show = false;

//---------------------------------
//--- Remote Control Definitions
//---------------------------------

// Pin definitions - connect these to ATtiny85
#define PIN_VOL_UP 3    // Volume Up (ATtiny85 pin 1)
#define PIN_VOL_DOWN 4  // Volume Down (ATtiny85 pin 2)
#define PIN_MUTE 5      // Mute (ATtiny85 pin 3)

bool is_muting = false;

// Command types
#define CMD_NONE 0
#define CMD_VOL_UP 1
#define CMD_VOL_DOWN 2
#define CMD_MUTE 3

#define DEBOUNCE_TIME 50

// Last time any button was pressed
unsigned long lastCommandTime = 0;


void setup() {

  if (DEBUG) {
    while (!Serial);
    Serial.begin(115200);
  }

  //---------------------------------
  // Set up the TV Out
  //---------------------------------

  // Initialize TV output with error checking
  int tv_status = tv.begin(NTSC, SCREEN_W, SCREEN_H);
  if (tv_status != 0) {
    DEBUG_PRINT(F("TV.begin failed with code: "));
    DEBUG_PRINTLN(tv_status);
  }

  // After TV output is confirmed working
  initOverlay();
  DEBUG_PRINTLN(F("Overlay initialized"));

  // Initialize display after successful TV start
  tv.select_font(font6x8);
  tv.fill(0);
  DEBUG_PRINTLN(F("TV Output initialized."));

  // Read previous volume if saved
  volume = EEPROM.read(EEPROM_ADDR_VOLUME);
  volume = constrain(volume, VOL_MIN, VOL_MAX);

  is_muting = EEPROM.read(EEPROM_ADDR_MUTING) == 1;
  if (is_muting) {
    prev_volume = volume;  // preserve it for later
    volume = 0;            // enforce mute
  } else {
    prev_volume = volume;
  }

  // Initialize SPI pins for digital potentiometer
  pinMode(POT_CS_PIN, OUTPUT);
  pinMode(POT_SCK_PIN, OUTPUT);
  pinMode(POT_MOSI_PIN, OUTPUT);
  digitalWrite(POT_CS_PIN, HIGH);  // CS inactive
  digitalWrite(POT_SCK_PIN, LOW);  // Clock low initially

  DEBUG_PRINTLN(F("SPI pins Initialized."));

  // Draw initial volume bar frame
  updateVolumeBar();

  // Initialize digital potentiometer with previous volume
  updateDigitalPot(volume);
  DEBUG_PRINTLN(F("Previous/Default volume set."));

  //---------------------------------
  // Setup the Remote Control Pins
  //---------------------------------

  pinMode(PIN_VOL_UP, INPUT);
  pinMode(PIN_VOL_DOWN, INPUT);
  pinMode(PIN_MUTE, INPUT);
}

// Initialize ATMega registers for video overlay capability.
// Must be called after tv.begin().
void initOverlay() {
  TCCR1A = 0;
  // Enable timer1.  ICES0 is set to 0 for falling edge detection on input capture pin.
  TCCR1B = _BV(CS10);

  // Enable input capture interrupt
  TIMSK1 |= _BV(ICIE1);

  // Enable external interrupt INT0 on pin 2 with falling edge.
  EIMSK = _BV(INT0);
  EICRA = _BV(ISC01);
}

// Required to reset the scan line when the vertical sync occurs
ISR(INT0_vect) {
  display.scanLine = 0;
}

void loop() {

  unsigned long currentTime = millis();

  // Check for commands on dedicated Pins
  if (currentTime - lastCommandTime > DEBOUNCE_TIME) {
    byte command = CMD_NONE;

    // Check all input pins
    if (digitalRead(PIN_VOL_UP) == HIGH) {
      command = CMD_VOL_UP;
    } else if (digitalRead(PIN_VOL_DOWN) == HIGH) {
      command = CMD_VOL_DOWN;
    } else if (digitalRead(PIN_MUTE) == HIGH) {
      command = CMD_MUTE;
    }

    // Process the command if one was detected
    if (command != CMD_NONE) {
      handleCommand(command);
      lastCommandTime = currentTime;
    }
  }

  // Update display and digital pot if needed
  if (display_update_needed) {
    updateDigitalPot(volume);  // Update digital potentiometer value
    display_update_needed = false;
  }

  updateVolumeBar();

  // Small delay to prevent display flicker
  tv.delay_frame(1);
}

/**
 * Increase volume with upper limit check
 */
void increaseVolume(uint8_t amount) {

  // Disable muting if volume changes
  if (is_muting) {
    toggleMuting();
  }

  if (volume < VOL_MAX) {
    volume = min(volume + amount, VOL_MAX);
    display_update_needed = true;
  } else {
    volume = 0;
    display_update_needed = true;
  }
  EEPROM.update(EEPROM_ADDR_VOLUME, volume);
}

/**
 * Decrease volume with lower limit check
 */
void decreaseVolume(uint8_t amount) {

  // Disable muting if volume changes
  if (is_muting) {
    toggleMuting();
  }

  if (volume > VOL_MIN) {
    volume = max(volume - amount, VOL_MIN);
    display_update_needed = true;
    EEPROM.update(EEPROM_ADDR_VOLUME, volume);
  }
}

/**
* Toggles Muting and saves/restores previous volume
*/
void toggleMuting(){
  if (!is_muting) {
    prev_volume = volume;
    volume = 0;
    is_muting = true;
  } else {
    volume = constrain(prev_volume, VOL_MIN, VOL_MAX);
    is_muting = false;
  }

  display_update_needed = true;

  EEPROM.update(EEPROM_ADDR_VOLUME, volume);
  EEPROM.update(EEPROM_ADDR_MUTING, is_muting ? 1 : 0);
}

/**
 * Draw the volume bar frame (outline)
 */
void drawVolumeBarFrame() {

  if(is_muting){
    tv.print(VOL_BAR_X, VOL_BAR_Y - 10, "MUTING");
  } else {
    // Draw header text
    tv.print(VOL_BAR_X, VOL_BAR_Y - 10, "VOL");
    tv.print(VOL_BAR_X + 20, VOL_BAR_Y - 10, volume);

    // Draw volume bar outline
    tv.draw_rect(VOL_BAR_X, VOL_BAR_Y, VOL_BAR_WIDTH, VOL_BAR_HEIGHT, WHITE);
  }
}

/**
 * Update the volume bar display based on current volume
 */
void updateVolumeBar() {

  unsigned long currentTime = millis();
  tv.fill(0);

  // Remove the OSD from the display after an amount of time
  // Always draw if muting
  if (!is_muting && (currentTime - lastCommandTime > OSD_DWELL_TIME)) {
    return;
  }

  drawVolumeBarFrame();

  // Clear the inside of the bar (leave border intact)
  tv.draw_rect(VOL_BAR_X + 1, VOL_BAR_Y + 1, VOL_BAR_WIDTH - 2, VOL_BAR_HEIGHT - 2, BLACK, BLACK);

  // Calculate fill width based on volume level
  uint8_t fill_width = (uint16_t)volume * (VOL_BAR_WIDTH - 2) / VOL_MAX;

  // Draw the filled portion of the volume bar
  if (volume > 0) {
    tv.draw_rect(VOL_BAR_X + 1, VOL_BAR_Y + 1, fill_width, VOL_BAR_HEIGHT - 2, WHITE, WHITE);
  }

  // Remember current volume to detect changes
  if(!is_muting){
    prev_volume = volume;
  }
}

/**
 * Update the digital potentiometer with the current volume value
 * For MCP4131, which has 129 steps (0-128) digital potentiometer
 */
void updateDigitalPot(uint8_t vol) {
  // Map volume (0-100) to pot range (0-128)
  uint8_t potValue = vol % 128;//map(vol, VOL_MIN, VOL_MAX, 0, 128);

  // Select the digital pot
  digitalWrite(POT_CS_PIN, LOW);

  // Send command byte (0x00 for write to pot)
  spiTransfer(0x00);

  // Send value byte
  spiTransfer(potValue);

  // Deselect the digital pot
  digitalWrite(POT_CS_PIN, HIGH);
}

/**
 * Bit-bang SPI data transfer function
 * Sends one byte to the SPI device
 */
void spiTransfer(uint8_t data) {
  // Send each bit, MSB first
  for (int bit = 7; bit >= 0; bit--) {
    // Set data bit
    if (data & (1 << bit))
      digitalWrite(POT_MOSI_PIN, HIGH);
    else
      digitalWrite(POT_MOSI_PIN, LOW);

    // Toggle clock to latch data
    digitalWrite(POT_SCK_PIN, HIGH);
    delayMicroseconds(1);
    digitalWrite(POT_SCK_PIN, LOW);
    delayMicroseconds(1);
  }
}

void handleCommand(byte command) {

  // Print command to serial
  DEBUG_PRINTLN("Command received: ");

  // Handle the command
  switch (command) {
    case CMD_VOL_UP:
      DEBUG_PRINTLN(F("CMD: VOLUME UP"));
      increaseVolume(1);
      break;

    case CMD_VOL_DOWN:
      DEBUG_PRINTLN(F("CMD: VOLUME DOWN"));
      decreaseVolume(1);
      break;

    case CMD_MUTE:
      DEBUG_PRINTLN(F("CMD: MUTE"));
      toggleMuting();
      break;
  }
}