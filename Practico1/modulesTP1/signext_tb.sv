`timescale  1ns / 10ps

module signext_tb();
    logic clk;
	logic [31:0] a;
    logic [63:0] y, y_expected;
    logic [31:0] vectornum, errors;

    logic [31:0] testvectors [0:9] = '{ 
        { 11'b111_1100_0010, 9'b000_101_101, 12'h335},
        { 11'b111_1100_0010, 9'b111_001_001, 12'h479},
        { 11'b111_1100_0000, 9'b010_000_111, 12'h905},
        { 11'b111_1100_0000, 9'b110_001_100, 12'habc},
        { 8'b101_1010_0, 16'h3346, 3'b101, 5'b01010},
        { 8'b101_1010_0, 16'habcd, 3'b010, 5'b10101},
        32'h0, 32'h1, 32'h5678, 32'habcde };

    logic [63:0] testvectors_expected [0:9] = '{ 
        { {55{1'b0}} , 9'b000_101_101 },
        { {55{1'b1}}, 9'b111_001_001 },
        { {55{1'b0}}, 9'b010_000_111 },
        { {55{1'b1}}, 9'b110_001_100 },
        { {45{1'b0}}, 16'h3346, 3'b101 },
        { {45{1'b1}}, 16'habcd, 3'b010 },
        64'h0, 64'h0, 64'h0, 64'h0 };

    signext dut(a, y);

    initial begin
        errors = 0; vectornum = 0;
    end

    always begin
        clk = 0; #10; clk = 1; #10;
    end

    always @(negedge clk) begin
        a = testvectors[vectornum];
        y_expected = testvectors_expected[vectornum];
    end

    always @(posedge clk) begin
        if (y !== y_expected) begin
            $display("Iteration %d", vectornum);
                    $display("Error: inputs = %b", a);
            $display("Error: outputs = %b (%b expected)", y, y_expected);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 32'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end    
endmodule
