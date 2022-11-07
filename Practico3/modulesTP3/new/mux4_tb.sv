module mux4_tb();
    logic clk;
    logic [63:0] d0, d1, d2, d3;
    logic [63:0] y, y_expected;
    logic [1:0] s;
    logic [31:0] vectornum, errors;

    logic [63:0] testvectors [0:3] = '{
        64'hfafafa, 64'hc0cac01a, 64'h939ca, 63'h71aca 
    };

    logic [1:0] signal [0:3] = '{
        2'b00, 2'b01, 2'b10, 2'b11
    };

    mux4 #(64) dut(d0, d1, d2, d3, s, y);

    initial begin
		 vectornum = 0; errors = 0;
	 end

    always begin
        clk = 0; #50; clk = 1; #50;
    end

    always @(negedge clk) begin
        d0 = testvectors[0];
        d1 = testvectors[1];
        d2 = testvectors[2];
        d3 = testvectors[3];
        s = signal[vectornum];
        y_expected = testvectors[vectornum];
    end
    
    always @(posedge clk) begin
        #1;
        if (y !== y_expected) begin
            $display("Error: inputs = %h, %h, %h, %h", testvectors[0], testvectors[1], testvectors[2], testvectors[3]);
            $display("Error: outputs = %h (%h expected)", y, y_expected);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 64'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule
