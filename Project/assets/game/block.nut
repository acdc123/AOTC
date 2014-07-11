class aotc.game.Block extends aotc.game.Sprite {
  selected = false;
  
  constructor() {
    base.constructor(SPRITE_BLOCK);
  }

  function isSelected(){
    return this.selected;
  }
  
  function setSelected(_selected){
    this.selected = _selected;
  }
  
}