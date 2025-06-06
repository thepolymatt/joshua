PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//232421/1381971/2.50/4/2/Crystal or Oscillator

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r180_120"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.2) (shapeHeight 1.8))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "ABM3B" (originalName "ABM3B")
		(multiLayer
			(pad (padNum 1) (padStyleRef r180_120) (pt -2, -1.2) (rotation 90))
			(pad (padNum 2) (padStyleRef r180_120) (pt 2, -1.2) (rotation 90))
			(pad (padNum 3) (padStyleRef r180_120) (pt 2, 1.2) (rotation 90))
			(pad (padNum 4) (padStyleRef r180_120) (pt -2, 1.2) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt -0.347, 0.03) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 1.6) (pt 2.5 1.6) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.5 1.6) (pt 2.5 -1.6) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.5 -1.6) (pt -2.5 -1.6) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 -1.6) (pt -2.5 1.6) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.75 1.6) (pt 0.75 1.6) (width 0.254))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.75 -1.6) (pt 0.75 -1.6) (width 0.254))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -2.141, -2.106) (radius 0.05903) (startAngle 0.0) (sweepAngle 0.0) (width 0.254))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -2.141, -2.106) (radius 0.05903) (startAngle 180.0) (sweepAngle 180.0) (width 0.254))
		)
	)
	(symbolDef "ABM3B-8.000MHZ-B2-T" (originalName "ABM3B-8.000MHZ-B2-T")

		(pin (pinNum 1) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 1300 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1070 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 1300 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 1070 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Normal"))
		))
		(pin (pinNum 4) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 1100 mils 100 mils) (width 6 mils))
		(line (pt 1100 mils 100 mils) (pt 1100 mils -200 mils) (width 6 mils))
		(line (pt 1100 mils -200 mils) (pt 200 mils -200 mils) (width 6 mils))
		(line (pt 200 mils -200 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 1150 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 1150 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "ABM3B-8.000MHZ-B2-T" (originalName "ABM3B-8.000MHZ-B2-T") (compHeader (numPins 4) (numParts 1) (refDesPrefix Y)
		)
		(compPin "1" (pinName "XTAL_1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "GND_1") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "XTAL_2") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "4" (pinName "GND_2") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "ABM3B-8.000MHZ-B2-T"))
		(attachedPattern (patternNum 1) (patternName "ABM3B")
			(numPads 4)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
			)
		)
		(attr "Mouser Part Number" "815-ABM3B-8.0-B2-T")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/ABRACON/ABM3B-8.000MHZ-B2-T?qs=NE97hfUNX0Ef9OqIOqO2cA%3D%3D")
		(attr "Manufacturer_Name" "ABRACON")
		(attr "Manufacturer_Part_Number" "ABM3B-8.000MHZ-B2-T")
		(attr "Description" "8 MHz +/-20ppm Crystal 18pF 200 Ohms 4-SMD, No Lead")
		(attr "<Hyperlink>" "https://abracon.com/Resonators/abm3b.pdf")
		(attr "<Component Height>" "1.1")
		(attr "<STEP Filename>" "ABM3B-8.000MHZ-B2-T.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=90;Y=0;Z=0")
	)

)
