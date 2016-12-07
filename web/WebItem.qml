///clickable and hoverable rectangle for mouse supportings applications
Rectangle {
	property Mixin hoverMixin: HoverMixin {}		///< hover mixin object proveds common API for mouse properties
	property alias hover: hoverMixin.value;			///< mouse hovered flag
	property alias clickable: hoverMixin.clickable;	///< flag which enables or disables mouse click event handling
	property alias hoverable: hoverMixin.enabled;	///< flag which enables or disables mouse hover event handling
	property alias cursor: hoverMixin.cursor;		///< mouse cursor property
	property alias activeHover: hoverMixin.activeHover;	///< flag which becames 'true' on 'mouseover' event and becames 'false' on 'mouseout' event
	property alias activeHoverEnabled: hoverMixin.activeHoverEnabled;	///< flag which enables or disables 'mouseover' and 'mouseout' event handling
	color: "transparent";				///< background color
	hoverMixin.cursor: "pointer";
	property string position;			///< position mode property
	property string title;				///< title attribute property

	/// @private
	function _update(name, value) {
		switch (name) {
			case 'title':
				this.element.dom.setAttribute('title', value);
				break;
			case 'position': 
				this.style('position', value); 
				break
		}
		_globals.core.Rectangle.prototype._update.apply(this, arguments);
	}
}