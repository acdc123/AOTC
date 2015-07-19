class aotc.game.TileBackground extends aotc.game.SpriteSheet {
	constructor() {
		base.constructor(ATLAS_GAME);
		frame = BACKGROUND_TILE;
		base.setZ(0);
	}
}