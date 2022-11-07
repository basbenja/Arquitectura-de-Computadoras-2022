// DATAPATH

module datapath #(parameter N = 64)
					(input logic reset, clk,
					input logic [3:0] AluControl,
					input logic [1:0] AluSrc,
					input logic memtoReg,
					input logic reg2loc,									
					input logic regWrite,	
					input logic	Branch,
					input logic memRead,
					input logic memWrite,
					input logic [3:0] EStatus, // new for exceptions
					input logic ERet, Exc,	// new for exceptions		
					input logic [31:0] IM_readData,
					input logic [N-1:0] DM_readData,
					output logic [N-1:0] IM_addr, DM_addr, DM_writeData,
					output logic DM_writeEnable, DM_readEnable,
					output logic ExcAck); // new for exceptions					
					
	logic PCSrc;
	logic [N-1:0] PCBranch_F, PCBranch_E, writeData_E, writeData3; 
	logic [N-1:0] signImm, readData1, readData2, readData3;
	logic [N-1:0] NextPC_F, EVAddr_F;
	logic zero;
	logic EProc_F;
	
	
	fetch 	#(64) 	FETCH 	(.PCSrc_F(PCSrc),
							.clk(clk),
							.reset(reset),
							.EProc_F(EProc_F),	// new
							.PCBranch_F(PCBranch_F),
							.EVAddr_F(EVAddr_F), // new
							.imem_addr_F(IM_addr),
							.NextPC_F(NextPC_F)); // new						
					
											
	
	decode 	#(64) 	DECODE 	(.regWrite_D(regWrite),
							.reg2loc_D(reg2loc), 
							.clk(clk),
							.writeData3_D(writeData3),
							.instr_D(IM_readData), 
							.signImm_D(signImm), 
							.readData1_D(readData1),
							.readData2_D(readData2));				
																									
									
											
	execute 	#(64) 	EXECUTE 	(.AluSrc(AluSrc),
									.AluControl(AluControl),
									.PC_E(IM_addr), 
									.signImm_E(signImm), 
									.readData1_E(readData1), 
									.readData2_E(readData2),
									.readData3_E(readData3),	// new
									.PCBranch_E(PCBranch_E), 
									.aluResult_E(DM_addr), 
									.writeData_E(DM_writeData), 
									.zero_E(zero));											
											
										
										
	memory				MEMORY	(.Branch_M(Branch), 
								.zero_M(zero), 
								.PCSrc_M(PCSrc));
										
										
										
	writeback #(64) 	WRITEBACK (.aluResult_W(DM_addr), 
									.DM_readData_W(DM_readData), 
									.memtoReg(memtoReg), 
									.writeData3_W(writeData3));		
			
		
	exception 	EXCEPTION	(.clk(clk),
							.reset(reset),
							.Exc(Exc),
							.ERet(ERet),
							.imem_addr_F(IM_addr),
							.NextPC_F(NextPC_F),
							.PCBranch_E(PCBranch_E),
							.EStatus(EStatus),
							.IM_readData(IM_readData),
							.EProc(EProc_F),
							.ExcAck(ExcAck),
							.readData3_E(readData3),
							.PCBranch(PCBranch_F),
							.EVAddr_F(EVAddr_F));

	// Salida de señales de control:
	assign DM_writeEnable = memWrite;
	assign DM_readEnable = memRead;
	
endmodule