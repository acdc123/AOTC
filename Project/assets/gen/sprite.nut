class aotc.game.Sprite extends emo.Sprite{
 
  function get2DVector(){
    return emo.Vec2(x,y);
  }
  
  function getDistanceFromAnotherSprite(_anotherSprite){
    return get2DVector().distance(_anotherSprite.get2DVector());
  }
  
}