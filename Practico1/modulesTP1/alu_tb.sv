`timescale  1ns / 10ps

module alu_tb();
    logic clk;
    logic [63:0] a, b;
    logic [3:0] ALUControl;
    logic [63:0] result, result_expected;
    logic zero, zero_expected;
    logic [31:0] vectornum, errors;

    logic [196:0] testvectors [0:15] = '{ 
        // ALUControl - a - b - result_expected - zero
        // calculator used: https://keisan.casio.com/exec/system/14495408631029
        // AND
        { 4'b0000, 64'habcde, 64'hef8965, 64'ha8844, 1'b0},
        { 4'b0000, 64'h45139432ab, 64'habef994, 64'h2943080, 1'b0},
        { 4'b0000, 64'h0, 64'h23653124d, 64'h0, 1'b1},
        // OR
        { 4'b0001, 64'habcde, 64'hef8965, 64'hefbdff, 1'b0},
        { 4'b0001, 64'h45139432ab, 64'habef994, 64'h451bbefbbf, 1'b0},
        // add
            // two positive numbers
            { 4'b0010, 64'h12345678, 64'h75abef, 64'h12aa0267, 1'b0},
            // two negative numbers
            { 4'b0010, 64'hdddd56a, 64'hefefefef, 64'hfdcdc559, 1'b0},
            // one positive, one negative
            { 4'b0010, 64'h12345678, 64'hefefefef, 64'h102244667, 1'b0},
            // overflow with two positive
            // { 4'b0010, 64'h, 64'h, 64'h},
        // sub
            // two positive numbers
            { 4'b0110, 64'h12345678, 64'h75abef, 64'h11beaa89, 1'b0},
            // two negative numbers
            { 4'b0110, 64'hdddd56a, 64'hefefefef, -64'he2121a85, 1'b0},
            // one positive, one negative
            { 4'b0110, 64'h12345678, 64'hefefefef, -64'hddbb9977, 1'b0},
            // overflow with two negative
            // { 4'b0110, 64'h, 64'h, 64'h},
        // pass input b
        { 4'b0111, 64'haaaaaa, 64'habcdef123, 64'habcdef123, 1'b0},
        { 4'b0111, 64'h12345, 64'hbaba6767, 64'hbaba6767, 1'b0},
        // default
        { 4'b1111, 64'h178492, 64'h454325, 64'hfffff, 1'b0 },
        { 4'b1110, 64'h89435, 64'habcaf, 64'hfffff, 1'b0 },
        { 4'b0011, 64'h99999, 64'haaaa, 64'hfffff, 1'b0 } };

    alu dut(a, b, ALUControl, result, zero);
	 
	 initial begin
        a = 64'b0; b = 64'b0; ALUControl = 4'b0;
        vectornum = 0; errors = 0;
    end

    always begin
        clk = 0; #100; clk = 1; #100;
    end

    always @(posedge clk)
        {ALUControl, a, b, result_expected, zero_expected} = testvectors[vectornum];

    always @(negedge clk) begin
        if (result != result_expected || zero != zero_expected) begin
            $display("Error in test %d", vectornum);
            $display("inputs: %h, %h", a, b);
            $display("output: %h, expected: %h", result, result_expected);
            errors++;
        end
        vectornum++;
        if (testvectors[vectornum] === 197'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule
