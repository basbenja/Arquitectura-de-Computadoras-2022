module maindec(input logic [10:0] Op,
               input logic  reset, ExtIRQ,
               output logic [1:0] ALUSrc, ALUOp,
               output logic [3:0] EStatus,
               output logic Reg2Loc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, 
               output logic ERet, NotAnInstr);
    
    logic [10:0] signals [0:6] = '{ 
        11'b0_00_0_1_0_0_0_10_0,   // R-type
        11'b0_01_1_1_1_0_0_00_0,   // LDUR
        11'b1_01_0_0_0_1_0_00_0,   // STUR
        11'b1_00_0_0_0_0_1_01_0,   // CBZ
        11'b0_00_0_0_0_0_1_01_1,   // ERET
        11'b1_10_0_1_0_0_0_01_0,   // MRS
        11'b0_00_0_0_0_0_0_00_0    // Invalid opcode
    };

    // Just to modify EStatus
    always_comb begin
        if (reset) EStatus = 4'b0;
        else if (ExtIRQ) EStatus = 4'b0001;
        else if (NotAnInstr) EStatus = 4'b0010;
        else EStatus = 4'b0;
    end
    
    // Manage all other signals
    always_comb
        if (reset) begin
            {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} = '0;
				NotAnInstr = 1'b0;
		  end
        else casez(Op)
            // R-type
            11'b100_0101_1000, 
            11'b110_0101_1000, 
            11'b100_0101_0000,
            11'b101_0101_0000: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} = 
                    signals[0];
				    NotAnInstr = 1'b0;
				end
            // LDUR
            11'b111_1100_0010: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} =
                    signals[1];
                NotAnInstr = 1'b0;
            end
            // STUR
            11'b111_1100_0000: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} =
                    signals[2];
                NotAnInstr = 1'b0;
            end
            // CBZ
            11'b101_1010_0???: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} =
                    signals[3];
                NotAnInstr = 1'b0;
            end        
            // ERET
            11'b110_1011_0100: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} =
                    signals[4];
                NotAnInstr = 1'b0;
            end
            // MRS
            11'b110_1010_1001: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} =
                    signals[5];
                NotAnInstr = 1'b0;
            end
            // Invalid opcode
            default: begin
                {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, ERet} =
                    signals[6];
                NotAnInstr = 1'b1;
            end
        endcase
endmodule