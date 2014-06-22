class aotc.gen.Level {

	function onActionDown(mevent){	
	}
	
	function onActionMove(mevent){
	}
	
	function onActionUp(mevent){
	}
	
	function onActionCancel(mevent){
	}

	function onLoad() {
	}

	function onGainedFocus() {

	}

	function onLostFocus() {

	}

	function onDispose() {

	}

	function onMotionEvent(mevent) {
		if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
			onActionDown(mevent);			  
		}
		else if (mevent.getAction() == MOTION_EVENT_ACTION_MOVE) {
			onActionMove(mevent);
		}
		else if (mevent.getAction() == MOTION_EVENT_ACTION_UP) {
			onActionUp(mevent);
		}
		else if (mevent.getAction() == MOTION_EVENT_ACTION_CANCEL){
		    onActionCancel(mevent);
		}
	}
}