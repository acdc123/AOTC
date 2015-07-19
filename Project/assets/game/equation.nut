class aotc.game.Equation {
	operandsLeft = null;
	operatorsLeft = null;
	operandsRight = null;
	operatorsRight = null;
	
	constructor(operandsLeft, operatorsLeft, operandsRight, operatorsRight) {
		this.operandsLeft = operandsLeft;
		this.operatorsLeft = operatorsLeft;
		this.operandsRight = operandsRight;
		this.operatorsRight = operatorsRight
	}
	
	function displayDebug() {
		local res = "";
		for (local i = 0; i < operandsLeft.len(); i++) {
			res += operandsLeft[i];
			if (i != operandsLeft.len() - 1) {
				res += operatorsLeft[i];
			}
		}
		res += "=";
		for (local i = 0; i < operandsRight.len(); i++) {
			res += operandsRight[i];
			if (i != operandsRight.len() - 1) {
				res += operatorsRight[i];
			}
		}
		print(res);
	}
}