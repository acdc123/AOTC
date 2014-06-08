class Game {

	stage = emo.Stage;
	blockSprite = emo.Sprite("block.png");
	dragStart = false;
	

	function onLoad() {
		blockSprite.moveCenter(stage.getCenterX(), stage.getCenterY());
		blockSprite.load();
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
		}

	}

}