module execute
            #(parameter N = 64)
            (input logic [1:0] AluSrc,
            input logic [3:0] AluControl,
            input logic [N-1:0] PC_E, signImm_E,
            input logic [N-1:0] readData1_E, readData2_E, readData3_E,
            output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
            output logic zero_E);

    logic [N-1:0] MUX4_out, SL2_out;

    // modified line for exceptions
    mux4    #(N)    MUX(readData2_E, signImm_E, readData3_E, readData3_E, AluSrc, MUX4_out);
    alu             ALU(readData1_E, MUX4_out, AluControl, aluResult_E, zero_E);
    sl2     #(N)    SL2(signImm_E, SL2_out);
    adder   #(N)    Add(PC_E, SL2_out, PCBranch_E);

    assign writeData_E = readData2_E;
endmodule