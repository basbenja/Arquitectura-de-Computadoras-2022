`timescale 1ns / 10ps

module maindec_tb();
    logic [10:0] Op;
    logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    logic [1:0] ALUOp;
    logic [32:0] errors;
	logic [8:0] signals;

    logic [10:0] Ops [0:9] = '{
        11'b111_1100_0010, // LDUR
        11'b111_1100_0000, // STUR
        11'b101_1010_0000, // CBZ
        11'b101_1010_0111, // CBZ
        11'b100_0101_1000, // ADD
        11'b110_0101_1000, // SUB
        11'b100_0101_0000, // AND
        11'b101_0101_0000, // ORR
        11'b111_1111_1111, // default
        11'b010_0101_0101  // default
    };

    logic [8:0] signals_expected [0:9] = '{
        { 7'b0_1_1_1_1_0_0, 2'b00 }, // LDUR
        { 7'b1_1_0_0_0_1_0, 2'b00 }, // STUR
        { 7'b1_0_0_0_0_0_1, 2'b01 }, // CBZ
        { 7'b1_0_0_0_0_0_1, 2'b01 }, // CBZ
        { 7'b0_0_0_1_0_0_0, 2'b10 }, // ADD
        { 7'b0_0_0_1_0_0_0, 2'b10 }, // SUB
        { 7'b0_0_0_1_0_0_0, 2'b10 }, // AND
        { 7'b0_0_0_1_0_0_0, 2'b10 }, // ORR
        9'b0, 9'b0
    };

    maindec dut(Op, Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);

    initial begin
        errors = 0;
        for (int i = 0; i < 10; i++) begin
            Op = Ops[i]; #1;
            signals = {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp};
            if (signals !== signals_expected[i]) begin
                $display("Error in test %d", i);
                $display("output: %b, expected: %b", signals, signals_expected[i]);
                errors++;
            end
        end
        $display("Tests completed with %d errors", errors);
    end
endmodule
