class Game {

	stage = emo.Stage;
	blockSprite = emo.Sprite("block.png");
	slotList = [];
	dragStart = false;
	
	function getDistance(x1, y1, x2, y2) {
		return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2));
	}

	function onLoad() {
		blockSprite.moveCenter(stage.getCenterX(), stage.getCenterY() - 50);
		for (local i = 0; i < 3; i++) {
			local slot = emo.Sprite("slot.png");
			slotList.push(slot);
			slot.moveCenter(stage.getCenterX() - 80 + 80 * i, stage.getCenterY() + 50);
		}
		blockSprite.load();
		for (local i = 0; i < 3; i++) {
			slotList[i].load();
		}
	}

	function onGainedFocus() {

	}

	function onLostFocus() {

	}

	function onDispose() {

	}

	function onMotionEvent(mevent) {
		if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
			if (blockSprite.contains(mevent.getX(), mevent.getY())) {
				dragStart = true;
			}
		}
		else if (mevent.getAction() == MOTION_EVENT_ACTION_MOVE) {
			if (dragStart) {
				blockSprite.moveCenter(mevent.getX(), mevent.getY());
			}
		}
		else if (mevent.getAction() == MOTION_EVENT_ACTION_UP || mevent.getAction() == MOTION_EVENT_ACTION_CANCEL) {
			if (dragStart) {
				dragStart = false;
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
	}
}