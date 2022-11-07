module execute
            #(parameter N = 64)
            (input logic AluSrc,
            input logic [3:0] AluControl,
            input logic [N-1:0] PC_E, signImm_E,
            input logic [N-1:0] readData1_E, readData2_E,
            output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
            output logic zero_E);

    logic [N-1:0] q, sl2_result;

    mux2 #(N) MUX(readData2_E, signImm_E, AluSrc, q);
    alu ALU(readData1_E, q, AluControl, aluResult_E, zero_E);
    sl2 #(N) shift_left2(signImm_E, sl2_result);
    adder #(N) Add(PC_E, sl2_result, PCBranch_E);
    assign writeData_E = readData2_E;
endmodule