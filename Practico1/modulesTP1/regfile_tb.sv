`timescale 1ns / 10ps

module regfile_tb();
    logic clk, we3;
    logic [4:0] ra1, ra2, wa3;
    logic [63:0] wd3;
    logic [63:0] rd1, rd2, rd1_expected, rd2_expected;
    logic [31:0] iternum, errors;
    logic [3:0] test;

    regfile dut(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
    
    always begin
        clk = 1; #10; clk = 0; #10;
    end

    initial begin
        errors = 0; iternum = 0; test = 3'd0;
        ra1 = 5'b0; ra2 = 5'b1;
        rd1_expected = 64'b0; rd2_expected = 64'b1;
        we3 = 0; wa3 = 5'd13; wd3 = 64'd12345;
    end

    always @(negedge clk) begin 
        // First, initialization test
        if (test === 3'd0) begin
            ra1 = ra1 + 2; ra2 = ra2 + 2;
            rd1_expected = rd1_expected + 2; rd2_expected = rd2_expected + 2;
            if (ra2 == 5'd31)
                rd2_expected = 64'b0;
        end
        // Then, write test
        else if (test === 3'd1) begin            
            we3 = 1'b1;            
            ra1 = 5'd13;
        end
        // Finally, X31 test
        else if (test === 3'd2) begin
            // we3 and wd3 already set from previous test
            wa3 = 5'd31;
            ra1 = 5'd31;
        end
    end

    always @(posedge clk) begin
        #1;
          if (test === 3'd0) begin
            iternum = iternum + 1;
            if (rd1 != rd1_expected || rd2 != rd2_expected) begin
                $display("Error: inputs =  ra1: %d, ra2: %d", ra1, ra2);
                $display("Error: outputs = rd1: %d, rd2: %d", rd1, rd2);
                $display("rd1 expected: %d, rd2 expected: %d)", rd1_expected, rd2_expected);
                errors = errors + 1;
            end
            if (ra2 === 5'd31) begin
                $display("%d initialization tests completed with %d errors", iternum, errors);
                test++;
            end
        end
        else if (test === 3'd1) begin
            if (rd1 != wd3)
                $display("Error in write test, output: %d, expected: %d", rd1, wd3);
            else
                $display("Success in write test");
            test++; 
        end
        else if (test === 3'd2) begin
            if (rd1 != 64'b0)
                $display("Error in X31 test, output: %d, expected: 0", rd1);
            else
                $display("Success in X31 test");
            $stop;
        end
    end
endmodule
