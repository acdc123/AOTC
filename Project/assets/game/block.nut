class aotc.game.Block extends aotc.game.SpriteSheet {
  selected = false;
  value = null;
  slot = null;

  valueSprite = null;

  constructor(type, value) {
    base.constructor(ATLAS_GAME);
    frame = BLOCK_TYPES[type];
    this.value = value;
		base.setZ(2);

    valueSprite = aotc.game.NormalFont();
    valueSprite.setText(value);
  }

  function isSelected(){
    return this.selected;
  }
  
  function setSelected(_selected){
    this.selected = _selected;
  }

  function move(x, y, z = null) {
    valueSprite.moveCenter(x + getScaledWidth() / 2, y + getScaledHeight() / 2);
    base.move(x, y);
  }

  function moveCenter(x, y, z = null) {
    valueSprite.moveCenter(x, y, z);
    base.moveCenter(x, y, z);
  }

  function load() {
    base.load();
    valueSprite.load();
  }

  function setZ(z) {
    base.setZ(z);
    valueSprite.setZ(z + 1);
  }
}