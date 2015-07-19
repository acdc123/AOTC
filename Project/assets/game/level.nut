class aotc.game.Level extends aotc.gen.Level {

	stage = emo.Stage;
	tileList = [];
	blockList = [];
	slotList = [];
	debugText = aotc.game.NormalFont();
	dragStart = false;
	
	// Offset from the cursor when the block is selected.
	// Used to prevent the block from jumping to the pointer location when initially selected.
	offsetX = -1;
	offsetY = -1;
	
	function drawBackground() {
		local x = 0;
		local y = 0;
		while (y < stage.windowHeight()) {
			x = 0;
			while (x < stage.windowWidth()) {
				local tile = aotc.game.TileBackground();
				tile.move(x, y);
				tile.load();
				x += TILE_WIDTH;
			}
			y += TILE_HEIGHT;
		}
	}
	
	function getDistance(x1, y1, x2, y2) {
		return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
	}
	
	function selectBlock(block, mevent){
		if (block.contains(mevent.getX(), mevent.getY())) {
			block.setSelected(true);
			offsetX = block.getX() + block.getWidth() / 2 - mevent.getX();
			offsetY = block.getY() + block.getHeight() / 2 - mevent.getY();
			return true;
		}	
		return false;
	}
	
	function displaceBlock(block, mevent){
		if (block.isSelected()) {
			block.moveCenter(mevent.getX() + offsetX, mevent.getY() + offsetY);
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
		srand(time());
		local z = Z_ORDER_BLOCK_START - 1;
		for (local i = 0; i < 3; i++) {
			local block = aotc.game.Block(0, rand() % (MAX_BLOCK_VALUE + 1));
			blockList.push(block);
			block.setZ(z);
			z -= 2;
			block.moveCenter(stage.getCenterX() - 80 + 80 * i, stage.getCenterY() - 50);	
		}
		for (local i = 0; i < 3; i++) {
			blockList[i].load();
		}

	}
	
	function onLoad() {
		drawBackground();
		initializeSlots();
		initializeBlocks();
		initializeText();
	}
}