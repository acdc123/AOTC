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
		local res = operands[0];
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
	
	/* Generates a simple equation in the form <operand> <operator> <operand> = <result>. */
	function generateSimpleEquation(max) {
			srand(time());
			local op1 = rand() % max + 1;
			local op2 = rand() % max + 1;
			local operator = convertToOperator(rand() % 4);
			
			local operands = [op1, op2];
			local operators = [operator];
			
			local result = evaluate(operands, operators);
			return aotc.game.Equation(operands, operators, [result], []);
	}
	
	function convertToOperator(code) {
		if (code == 0) {
			return "+";
		}
		if (code == 1) {
			return "-";
		}
		if (code == 2) {
			return "*";
		}
		if (code == 3) {
			return "/";
		}
		return "?";
	}
}