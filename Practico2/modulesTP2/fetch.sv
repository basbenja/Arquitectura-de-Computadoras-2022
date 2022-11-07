module fetch
        #(parameter N = 64)       
        (input logic PCSrc_F, clk, reset,
        input logic [N-1:0] PCBranch_F,
        output logic [N-1:0] imem_addr_F);
    
    logic [N-1:0] d, adder_output;

    mux2 #(N) MUX(adder_output, PCBranch_F, PCSrc_F, d);
	flopr #(N) PC(clk, reset, d, imem_addr_F);
	adder #(N) Add(imem_addr_F, N'('d4), adder_output);
endmodule
