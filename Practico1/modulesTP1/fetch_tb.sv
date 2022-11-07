`timescale 1ns / 10ps

module fetch_tb();
    logic PCSrc_F, clk, reset;
    logic [63:0] PCBranch_F;
    logic [63:0] imem_addr_F, PC_expected;
    logic [31:0] errors;

    fetch dut(PCSrc_F, clk, reset, PCBranch_F, imem_addr_F);

    always begin
        clk = 0; #10; clk = 1; #10;
    end

    initial begin
        PC_expected = 0; errors = 0;
        PCSrc_F = 0; PCBranch_F = 64'd456789;
        reset = 1; 
        #100; // wait 5 clock cycles
        reset = 0;
        #100;
        PCSrc_F = 1;
        #100;
        $display("Tests finished with %d errors", errors);
        $stop;
    end
	 
    // Just one negedge reset in all the simulation
    always @(negedge reset) begin 
        if (imem_addr_F != 64'b0) begin
            $display("Error in PC when reset turned 0:");
            $display("output: %d, expected: 0", imem_addr_F);
        end
    end

	always @(posedge clk && reset == 0) begin
        if (~PCSrc_F) begin
            PC_expected += 64'd4; #1;
            if (imem_addr_F != PC_expected) begin
                $display("Error in PC: output %d, expected %d", imem_addr_F, PC_expected);
                errors++;
            end
        end
        else begin
            #1;
            if (imem_addr_F != PCBranch_F) begin
                $display("Error in PC when branching");
                $display("output: %d, expected: %d", imem_addr_F, PCBranch_F);
                errors++;
				end
        end
    end	 
endmodule
