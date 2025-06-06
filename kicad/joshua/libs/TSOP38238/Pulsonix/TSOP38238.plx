PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//183648/1381971/2.50/3/4/Integrated Circuit

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c156_h106"
		(holeDiam 1.06)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.56) (shapeHeight 1.56))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.56) (shapeHeight 1.56))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "TSOP38238" (originalName "TSOP38238")
		(multiLayer
			(pad (padNum 1) (padStyleRef c156_h106) (pt -2.54, -1.45) (rotation 90))
			(pad (padNum 2) (padStyleRef c156_h106) (pt 0, -1.45) (rotation 90))
			(pad (padNum 3) (padStyleRef c156_h106) (pt 2.54, -1.45) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt -0.365, -2.786) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 0) (pt 2.5 0) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.5 0) (pt 2.5 -4.8) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.5 -4.8) (pt -2.5 -4.8) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 -4.8) (pt -2.5 0) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.5 0) (pt 2.5 0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.5 -4.8) (pt 2.5 -4.8) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2.5 -4.8) (pt 2.5 -2.4) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.5 -4.8) (pt -2.5 -2.4) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -3.494, -2.588) (radius 0.071) (startAngle 0.0) (sweepAngle 0.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -3.494, -2.588) (radius 0.071) (startAngle 180.0) (sweepAngle 180.0) (width 0.2))
		)
	)
	(symbolDef "TSOP38238" (originalName "TSOP38238")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 700 mils 100 mils) (width 6 mils))
		(line (pt 700 mils 100 mils) (pt 700 mils -300 mils) (width 6 mils))
		(line (pt 700 mils -300 mils) (pt 200 mils -300 mils) (width 6 mils))
		(line (pt 200 mils -300 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 750 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 750 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "TSOP38238" (originalName "TSOP38238") (compHeader (numPins 3) (numParts 1) (refDesPrefix IC)
		)
		(compPin "1" (pinName "OUT") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "GND") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "3" (pinName "VS") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "TSOP38238"))
		(attachedPattern (patternNum 1) (patternName "TSOP38238")
			(numPads 3)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
			)
		)
		(attr "Mouser Part Number" "782-TSOP38238")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Vishay-Semiconductors/TSOP38238?qs=RzxYCzJDjPVjpHVZS582Ng%3D%3D")
		(attr "Manufacturer_Name" "Vishay")
		(attr "Manufacturer_Part_Number" "TSOP38238")
		(attr "Description" "IR Remote Receiver 38KHz 45m")
		(attr "<Hyperlink>" "")
		(attr "<STEP Filename>" "TSOP38238.stp")
		(attr "<STEP Offsets>" "X=0;Y=0.27;Z=7.03")
		(attr "<STEP Rotation>" "X=90;Y=0;Z=0")
	)

)
