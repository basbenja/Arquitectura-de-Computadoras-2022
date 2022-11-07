// CONTROLLER

module controller(input logic [10:0] instr,
				  input logic reset, ExtIRQ, ExcAck,
				  output logic [3:0] AluControl,
				  output logic [1:0] AluSrc,
				  output logic memtoReg, reg2loc, regWrite, Branch, memRead, memWrite,
				  output logic [3:0] EStatus,
				  output logic ERet, Exc, ExtIAck);
											
	logic [1:0] AluOp_s;
	logic NotAnInstr;

	// ExtIAck must be ‘1’ when ExcAck = ‘1’ y ExtIRQ = ‘1’, if not it must be ‘0’
	// ExtIAck = External Interrupt Acknowledged
	assign ExtIAck = ExcAck & ExtIRQ;

	// Output Exc of #controller module must be the result of an OR operation
	// between input ExtIRQ intern signal NotAnInstr
	// This means that an excpetion will only ocurr by external request (ExtIRQ)
	// or by an invalid opcode (NotAnInstr)
	assign Exc = ExtIRQ | NotAnInstr;

	maindec 	decPpal 	(.Op(instr),
							.reset(reset),
							.ExtIRQ(ExtIRQ),
							.ALUSrc(AluSrc), 
							.ALUOp(AluOp_s),
							.EStatus(EStatus),
							.Reg2Loc(reg2loc), 
							.MemtoReg(memtoReg), 
							.RegWrite(regWrite), 
							.MemRead(memRead), 
							.MemWrite(memWrite), 
							.Branch(Branch),
							.ERet(ERet),
							.NotAnInstr(NotAnInstr));	
	
	aludec 	decAlu 	(.funct(instr), 
					.aluop(AluOp_s), 
					.alucontrol(AluControl));
			
endmodule
