aotc <- {
	game = {},
	gen = {}
}

emo.Runtime().import("gen/util.nut");
emo.Runtime().import("gen/spritesheet.nut");
emo.Runtime().import("gen/textsprite.nut");
emo.Runtime().import("gen/level.nut");

emo.Runtime().import("constants/gameConst.nut");
emo.Runtime().import("constants/spriteConst.nut");

emo.Runtime().import("game/normal_font.nut");

emo.Runtime().import("game/equation.nut");
emo.Runtime().import("game/logic.nut");
emo.Runtime().import("game/block.nut");
emo.Runtime().import("game/slot.nut");
emo.Runtime().import("game/level.nut");
emo.Runtime().import("game/tile_background.nut");

emo.Runtime().setOptions(OPT_ORIENTATION_LANDSCAPE);

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
            local logic = aotc.game.Logic();
						local eq = logic.generateSimpleEquation(10);
						eq.displayDebug();
        }
    }
}

function emo::onLoad() {
  emo.Stage().load(aotc.game.Level());
}
