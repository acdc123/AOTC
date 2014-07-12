class aotc.game.Block extends aotc.game.SpriteSheet {
  selected = false;
  slot = null;

  constructor(type) {
    base.constructor(ATLAS_GAME);
    frame = BLOCK_TYPES[type];
  }

  function isSelected(){
    return this.selected;
  }
  
  function setSelected(_selected){
    this.selected = _selected;
  }
}