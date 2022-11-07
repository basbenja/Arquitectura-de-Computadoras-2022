module fetch
        #(parameter N = 64)       
        (input logic PCSrc_F, clk, reset, EProc_F,
        input logic [N-1:0] PCBranch_F, EVAddr_F,
        output logic [N-1:0] imem_addr_F,
        output logic [N-1:0] NextPC_F);
    
    logic [N-1:0] MUX2_1_out, MUX2_2_out, Add_out;

    mux2    #(N)    MUX2_1(Add_out, PCBranch_F, PCSrc_F, NextPC_F);
    // new line for exceptions:
    mux2    #(N)    MUX2_2(NextPC_F, EVAddr_F, EProc_F, MUX2_2_out);
    flopr   #(N)    PC(clk, reset, MUX2_2_out, imem_addr_F);
    adder   #(N)    Add(imem_addr_F, N'('h4), Add_out);
endmodule