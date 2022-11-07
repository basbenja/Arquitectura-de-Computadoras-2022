module signext(input logic [31:0] a,
				  output logic [63:0] y);
	always_comb
		// casez allows careless conditions (?)
		casez(a[31:21])
			// ldur: extends DTAddr (type D instruction)
			11'b111_1100_0010: y = { {55{a[20]}}, a[20:12] };
			// stur: extends DTAddr (type D instruction)
			11'b111_1100_0000: y = { {55{a[20]}}, a[20:12] };
			// cbz (type CB instruction)
			11'b101_1010_0???: y = { {45{a[23]}}, a[23:5] };
			// default
			default: y = '0;
		endcase
endmodule 
