/*
  TODO: Copyright notice
*/

#include "PinChangeInterrupt.h"
#include "IRLremote.h"

#define PIN_IR_INPUT 0

// Define pins for output signals
#define PIN_VOL_UP 1
#define PIN_VOL_DOWN 2
#define PIN_MUTE 3
#define PIN_POWER 4

// Timing constants (in milliseconds)
#define SIGNAL_DURATION 100    // Duration to keep the signal pin HIGH
#define DEBOUNCE_DELAY 200     // Debounce delay after a signal

// Variable to track the last time a command was sent
unsigned long lastCommandTime = 0;

// Choose the IR protocol of your remote. See the other example for this.
CZenith IRLremote;

void setup()
{
  // Initialize output pins
  pinMode(PIN_VOL_UP, OUTPUT);
  pinMode(PIN_VOL_DOWN, OUTPUT);
  pinMode(PIN_MUTE, OUTPUT);
  pinMode(PIN_POWER, OUTPUT);
  
  // Set all pins to LOW initially
  digitalWrite(PIN_VOL_UP, LOW);
  digitalWrite(PIN_VOL_DOWN, LOW);
  digitalWrite(PIN_MUTE, LOW);
  digitalWrite(PIN_POWER, LOW);
  
  // Start reading the remote
  if (!IRLremote.begin(PIN_IR_INPUT));
}

void loop()
{
  // Check if new IR protocol data is available
  if (IRLremote.available())
  {
    // Get the new data from the remote
    auto data = IRLremote.read();

    // Address, Command
    // Volume Up: 0xEB, 0x74
    // Volume down: 0xDB, 0x74
    // Mute: 0xEB, 0xB4 (or B5)
    // Power:0x6B, 0x76 (or 77)
    
    // Check if debounce time has passed
    unsigned long currentTime = millis();
    if (currentTime - lastCommandTime >= DEBOUNCE_DELAY + SIGNAL_DURATION)
    {
      // Process the received IR code
      if (data.address == 0xEB && data.command == 0x74)
      {
        // Volume Up
        digitalWrite(PIN_VOL_UP, HIGH);
        delay(SIGNAL_DURATION);
        digitalWrite(PIN_VOL_UP, LOW);
        lastCommandTime = currentTime;
      }
      else if (data.address == 0xDB && data.command == 0x74)
      {
        // Volume Down
        digitalWrite(PIN_VOL_DOWN, HIGH);
        delay(SIGNAL_DURATION);
        digitalWrite(PIN_VOL_DOWN, LOW);
        lastCommandTime = currentTime;
      }
      else if (data.address == 0xEB && (data.command == 0xB4 || data.command == 0xB5))
      {
        // Mute
        digitalWrite(PIN_MUTE, HIGH);
        delay(SIGNAL_DURATION);
        digitalWrite(PIN_MUTE, LOW);
        lastCommandTime = currentTime;
      }
      else if (data.address == 0x6B && (data.command == 0x76 || data.command == 0x77))
      {
        // Power
        digitalWrite(PIN_POWER, HIGH);
        delay(SIGNAL_DURATION);
        digitalWrite(PIN_POWER, LOW);
        lastCommandTime = currentTime;
      }
    }
  }
}