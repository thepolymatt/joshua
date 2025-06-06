SamacSys ECAD Model
183632/1381971/2.50/3/4/Undefined or Miscellaneous

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c165_h110"
		(holeDiam 1.1)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.650) (shapeHeight 1.650))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.650) (shapeHeight 1.650))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "TSOP34438" (originalName "TSOP34438")
		(multiLayer
			(pad (padNum 1) (padStyleRef c165_h110) (pt 0.000, 0.000) (rotation 90))
			(pad (padNum 2) (padStyleRef c165_h110) (pt 2.540, 0.000) (rotation 90))
			(pad (padNum 3) (padStyleRef c165_h110) (pt 5.080, 0.000) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 2.322, -1.250) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.46 1.55) (pt 5.54 1.55) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 5.54 1.55) (pt 5.54 -4.05) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt 5.54 -4.05) (pt -0.46 -4.05) (width 0.2))
		)
		(layerContents (layerNumRef 28)
			(line (pt -0.46 -4.05) (pt -0.46 1.55) (width 0.2))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.76 2.05) (pt 6.405 2.05) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 6.405 2.05) (pt 6.405 -4.55) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 6.405 -4.55) (pt -1.76 -4.55) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.76 -4.55) (pt -1.76 2.05) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.16 0.05) (pt -1.16 0.05) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -1.16, -0.05) (radius 0.1) (startAngle 90.0) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.16 -0.15) (pt -1.16 -0.15) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(arc (pt -1.16, -0.05) (radius 0.1) (startAngle 270) (sweepAngle 180.0) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.46 1.05) (pt -0.46 1.55) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.46 1.55) (pt 5.54 1.55) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 5.54 1.55) (pt 5.54 1.05) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.46 -1.45) (pt -0.46 -4.05) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -0.46 -4.05) (pt 5.54 -4.05) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 5.54 -4.05) (pt 5.54 -1.45) (width 0.1))
		)
	)
	(symbolDef "TSOP34438" (originalName "TSOP34438")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 700 mils 100 mils) (width 6 mils))
		(line (pt 700 mils 100 mils) (pt 700 mils -300 mils) (width 6 mils))
		(line (pt 700 mils -300 mils) (pt 200 mils -300 mils) (width 6 mils))
		(line (pt 200 mils -300 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 750 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "TSOP34438" (originalName "TSOP34438") (compHeader (numPins 3) (numParts 1) (refDesPrefix U)
		)
		(compPin "1" (pinName "OUT") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "GND") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "3" (pinName "VS") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "TSOP34438"))
		(attachedPattern (patternNum 1) (patternName "TSOP34438")
			(numPads 3)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
			)
		)
		(attr "Mouser Part Number" "78-TSOP34438")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Vishay-Semiconductors/TSOP34438?qs=RzxYCzJDjPVT3TKEZ1O4pg%3D%3D")
		(attr "Manufacturer_Name" "Vishay")
		(attr "Manufacturer_Part_Number" "TSOP34438")
		(attr "Description" "IR Remote Receiver 38KHz 45m")
		(attr "Datasheet Link" "https://www.vishay.com/docs/82489/tsop322.pdf")
		(attr "Height" "10.25 mm")
	)

)
