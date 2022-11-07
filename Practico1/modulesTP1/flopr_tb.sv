`timescale 1ns / 10ps

module flopr_tb();
    logic clk, reset;
    logic [63:0] d, q, q_expected;
    logic [31:0] vectornum, errors;
    
    
    logic [63:0] testvectors [0:9] = '{ 
        64'h0, 64'h1, 64'h6523, 64'habcde, 64'h5555,
        64'h8956, 64'hfabd, 64'hbbdd, 64'h8888,
        64'h223432};
    
    logic [63:0] testvectors_expected [0:9] = '{ 
        64'h0, 64'h0, 64'h0, 64'h0, 64'h0,
        64'h8956, 64'hfabd, 64'hbbdd, 64'h8888,
        64'h223432};

    flopr #(64) dut(clk, reset, d, q);
    
    always begin
        clk = 0; #10; clk = 1; #10;
    end
            
    initial begin
        errors = 0; vectornum = 0;
        reset = 1; #100; reset = 0;
    end
    
    always @(negedge clk) begin
            d = testvectors[vectornum];
            q_expected = testvectors_expected[vectornum];
    end
    
    always @(posedge clk) begin
        #1;
        if (q !== q_expected) begin
            $display("Error: inputs = %h", d);
            $display("Error: outputs = %h (%h expected)", q, q_expected);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 64'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule
