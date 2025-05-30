module maindec(input logic [10:0] Op,
               output logic Reg2Loc, ALUSrc, MemtoReg, RegWrite, 
               output logic MemRead, MemWrite, Branch,
               output logic [1:0] ALUOp);
    
    logic [8:0] signals [0:3] = '{ 
        { 7'b0_1_1_1_1_0_0, 2'b00 },// LDUR
        { 7'b1_1_0_0_0_1_0, 2'b00 },// STUR
        { 7'b1_0_0_0_0_0_1, 2'b01 },// CBZ
        { 7'b0_0_0_1_0_0_0, 2'b10 } }; // R-format

    always_comb
        casez(Op)
            // LDUR
            11'b111_1100_0010:
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 
                    signals[0];
            // STUR
            11'b111_1100_0000:
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 
                    signals[1];
            // CBZ
            11'b101_1010_0???:
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 
                    signals[2];         
            // R-format
            11'b100_0101_1000, 
            11'b110_0101_1000, 
            11'b100_0101_0000,
            11'b101_0101_0000:
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 
                    signals[3]; 
            // default
            default:
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 
                    9'b0;
        endcase
endmodule
