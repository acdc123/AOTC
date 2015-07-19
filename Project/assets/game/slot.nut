class aotc.game.Slot extends aotc.game.SpriteSheet {
	content = null;

	constructor() {
		base.constructor(ATLAS_GAME);
		frame = "slot";
		base.setZ(1);
	}

	function attachBlock(block) {
		content = block;
		block.slot = this;
	}

	function detachBlock() {
		if (content != null) {
			content.slot = null;
			content = null;
		}
	}
}