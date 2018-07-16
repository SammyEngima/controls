/// google material icon control
Text {
	property alias icon: text;				///< material icon name
	property alias size: font.pixelSize;	///< material icon size
	font.family: "Material Icons";			///< @private

	constructor: {
		_globals.html5.html.loadExternalStylesheet("https://fonts.googleapis.com/icon?family=Material+Icons")
	}
}
