Object {
	property Object target;

	constructor: {
		if (this.parent) {
			if (this.element)
				throw new Error('double ctor call')

			this._createElement(this.getTag(), this.externalTarget())
		} //no parent == top level element, skip
	}

	/// specialized implementation of element creation in a certain namespace.
	function _createElement(tag, append) {
		this.element = new _globals.html5.html.Element(this, document.createElementNS('http://www.w3.org/2000/svg', tag))
		if (!append) {
			this.parent.element.append(this.element)
		}
	}

	/// returns tag for corresponding element
	function getTag() { return 'svg' }

	function registerStyle(style, tag) {
		style.addRule(tag, 'position: absolute; visibility: inherit; overflow: visible;')
	}

	function externalTarget() { return false }

	onTargetChanged: { value.element.remove(); value.element.append(this.element) }

	function style(name, style) {
		var element = this.element
		if (element)
			return element.style(name, style)
		else
			log('WARNING: style skipped:', name, style)
	}
}
