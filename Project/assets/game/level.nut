class aotc.game.Level extends aotc.gen.Level {

	stage = emo.Stage;
	blockList = [];
	slotList = [];
	debugText = aotc.game.NormalFont();
	dragStart = false;
	
	function getDistance(x1, y1, x2, y2) {
		return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
	}
	
	function selectBlock(block, mevent){
		if (block.contains(mevent.getX(), mevent.getY())) {
			block.setSelected(true);
			return true;
		}	
		return false;
	}
	
	function displaceBlock(block, mevent){
		if (block.isSelected()) {
			block.moveCenter(mevent.getX(), mevent.getY());
			if (block.slot != null) {
				block.slot.detachBlock();
			}
		}	
	}
	
	function stopBlock(block){
		if (block.isSelected()) {
			block.setSelected(false); 
		}
		
		local min = 1 << 31 - 1;
		local minIndex = -1;	
		for (local i = 0; i < slotList.len(); i++) {
			if (block.collidesWith(slotList[i])) {
				local dist = getDistance(block.getX(), block.getY(), slotList[i].getX(), slotList[i].getY());
				if (dist < min) {
					min = dist;
					minIndex = i;
				}
			}
		}
		if (minIndex != -1) {
			slotList[minIndex].attachBlock(block);
			block.move(slotList[minIndex].getX(), slotList[minIndex].getY());
		}
	}
	
	function onActionDown(mevent){	
		for (local i = 0; i < blockList.len(); i++) {
			if (selectBlock(blockList[i], mevent)) {
				break;
			}
		}
	}
		
	function onActionMove(mevent){
    for (local i = 0; i < blockList.len(); i++) {
			displaceBlock(blockList[i], mevent);
		}
	}
	
	function onActionUp(mevent){
		for (local i = 0; i < blockList.len(); i++) {
			stopBlock(blockList[i]);
		}
	}
	
	function onActionCancel(mevent){
		for (local i = 0; i < blockList.len(); i++) {
			stopBlock(blockList[i]);
		}
	}

	function initializeText() {
		debugText.setText("DEBUG TEXT! *");
		debugText.load();
	}
		
	function initializeSlots(){
		for (local i = 0; i < 3; i++) {
			local slot = aotc.game.Slot();
			slotList.push(slot);
			slot.moveCenter(stage.getCenterX() - 80 + 80 * i, stage.getCenterY() + 50);
		}	
		
		for (local i = 0; i < 3; i++) {
			slotList[i].load();
		}
	}
	
	function initializeBlocks(){
		local z = Z_ORDER_BLOCK_START;
		for (local i = 0; i < 3; i++) {
			local block = aotc.game.Block(i);
			blockList.push(block);
			block.setZ(z--);
			block.moveCenter(stage.getCenterX() - 80 + 80 * i, stage.getCenterY() - 50);	
		}
		for (local i = 0; i < 3; i++) {
			blockList[i].load();
		}

	}
	
	function onLoad() {
		initializeSlots();
		initializeBlocks();
		initializeText();
	}
}