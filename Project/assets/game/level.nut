class aotc.game.Level extends aotc.gen.Level {

	stage = emo.Stage;
	blockSprite = aotc.game.Sprite(SPRITE_BLOCK);
	slotList = [];
	dragStart = false;
	
	function getDistance(x1, y1, x2, y2) {
		return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
	}
	
	function selectBlock(mevent){
		if (blockSprite.contains(mevent.getX(), mevent.getY())) {
			blockSprite.setSelected(true); 
		}	
	}
	
	function displaceBlock(mevent){
		if (blockSprite.isSelected()) {
			blockSprite.moveCenter(mevent.getX(), mevent.getY());
		}	
	}
	
	function stopBlock(){
		if (blockSprite.isSelected()) {
			blockSprite.setSelected(false); 
		}
		
		local min = 1 << 31 - 1;
		local minIndex = -1;	
		for (local i = 0; i < slotList.len(); i++) {
			if (blockSprite.collidesWith(slotList[i])) {
				local dist = getDistance(blockSprite.getX(), blockSprite.getY(), slotList[i].getX(), slotList[i].getY());
				if (dist < min) {
					min = dist;
					minIndex = i;
				}
			}
		}
		if (minIndex != -1) {
			blockSprite.move(slotList[minIndex].getX(), slotList[minIndex].getY());
		}
	}
	
	function onActionDown(mevent){	
		selectBlock(mevent);  	 
	}
		
	function onActionMove(mevent){
    	displaceBlock(mevent);
	}
	
	function onActionUp(mevent){
		stopBlock();
	}
	
	function onActionCancel(mevent){
		stopBlock();
	}
		
	function initializeSlots(){
		for (local i = 0; i < 3; i++) {
			local slot = aotc.game.Sprite(SPRITE_SLOT);
			slotList.push(slot);
			slot.moveCenter(stage.getCenterX() - 80 + 80 * i, stage.getCenterY() + 50);
		}	
		
		for (local i = 0; i < 3; i++) {
			slotList[i].load();
		}
	}
	
	function initializeBlocks(){
		blockSprite.moveCenter(stage.getCenterX(), stage.getCenterY() - 50);
		blockSprite.load();
	}
	
	function onLoad() {
		initializeSlots();
		initializeBlocks();
	}
}