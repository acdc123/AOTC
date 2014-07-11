class aotc.game.Logic {
	/* Evaluates an equation, given two arrays operands (containing all operands in order) and operators
	(containing all operators in String format) in order. Returns null if the equation is invalid,
	"undefined" if the result is undefined, or the result otherwise. */
	function evaluate(operands, operators) {
		if (operands.len() != operators.len() + 1) {
			return null;
		}
		if (operands.len() == 0) {
			return 0;
		}
		local res = 0;
		for (local i = 1; i < operands.len(); i++) {
			local o = operands[i];
			local op = operators[i - 1];
			if (op == "+") {
				res += o;
			}
			else if (op == "-") {
				res -= o;
			}
			else if (op == "*") {
				res *= o;
			}
			else if (op == "/") {
				if (o == 0) {
					return "undefined";
				}
				res /= o;
			}
		}
		return res;
	}
}