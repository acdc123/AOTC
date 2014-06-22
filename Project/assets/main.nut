aotc <- {
	game = {},
	gen = {}
}

emo.Runtime().import("gen/util.nut");
emo.Runtime().import("gen/sprite.nut");
emo.Runtime().import("gen/level.nut");

emo.Runtime().import("constants/gameConst.nut");
emo.Runtime().import("constants/spriteConst.nut");

emo.Runtime().import("game/level.nut");

emo.Runtime().setOptions(OPT_ORIENTATION_PORTRAIT);

class aotc.game.Main {
    /*
     * Called when this class is loaded
     */
    function onLoad() {
        print("onLoad"); 
    }

    /*
     * Called when the app has gained focus
     */
    function onGainedFocus() {
        print("onGainedFocus");
    }

    /*
     * Called when the app has lost focus
     */
    function onLostFocus() {
        print("onLostFocus"); 
    }

    /*
     * Called when the class ends
     */
    function onDispose() {
        print("onDispose");
    }

    /*
     * touch event
     */
    function onMotionEvent(mevent) {
        if (mevent.getAction() == MOTION_EVENT_ACTION_DOWN) {
            print(format("EVENT: %dx%d", mevent.getX(), mevent.getY()));
        }
    }
}

function emo::onLoad() {
    emo.Stage().load(aotc.game.Level());
}
