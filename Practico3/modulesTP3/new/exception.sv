module exception 
    (input logic clk, reset, Exc, ERet,
    input logic [63:0] imem_addr_F, NextPC_F, PCBranch_E,
	input logic [3:0] EStatus,
    input logic [31:0] IM_readData,
	output logic EProc, ExcAck,
    output logic [63:0] readData3_E, PCBranch, EVAddr_F);

    logic [63:0] ExcVector = 64'hD8;
    assign EVAddr_F = ExcVector;

    logic [63:0] ELR_out, ERR_out;
    logic [3:0] ESR_out;
    logic COMP_N_out, esync_out;

    comp_n  #(64)   COMP_N  (ExcVector, imem_addr_F, COMP_N_out);
    esync           ESYNC   (Exc, COMP_N_out, reset, esync_out);
    assign EProc = esync_out & ~reset;
    
    flopr_e #(64)   ELR     (clk, reset, EProc, imem_addr_F, ELR_out);
    flopr_e #(4)    ESR     (clk, reset, EProc, EStatus, ESR_out);
    flopr_e #(64)   ERR     (clk, reset, EProc, NextPC_F, ERR_out);
    
    mux4    #(64)   MUX4    (ERR_out, ELR_out, {60'b0, ESR_out}, 64'b0, IM_readData[13:12], readData3_E);
    mux2    #(64)   MUX2    (PCBranch_E, ERR_out, ERet, PCBranch);

    // Outputs: signals that go to original datapath
	assign ExcAck = COMP_N_out;
endmodule