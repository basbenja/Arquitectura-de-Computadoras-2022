module alu(input logic [63:0] a, b,
		   input logic [3:0] ALUControl,
		   output logic [63:0] result, 
		   output logic zero);
	
	always_comb begin
		case(ALUControl)
			// AND
			4'b0000: result = a & b;
			// OR
			4'b0001: result = a | b;
			// add (a+b)
			4'b0010: result = a + b;
			// sub (a-b) con complemento a dos
			4'b0110: result = a + (~b + 64'b1);
			// pass input b
			4'b0111: result = b;
			//default
			default: result = 64'hfffff;
		endcase
		zero = (result == 64'b0) ? 1'b1 : 1'b0; 
	end
endmodule
