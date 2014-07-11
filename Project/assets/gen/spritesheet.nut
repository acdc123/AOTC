class aotc.game.SpriteSheet extends emo.SpriteSheet {

	frame = "";

  function get2DVector(){
    return emo.Vec2(x,y);
  }
  
  function getDistanceFromAnotherSprite(_anotherSprite){
    return get2DVector().distance(_anotherSprite.get2DVector());
  }

  function load() {
		base.load();
		this.selectFrame(frame);
	}
}