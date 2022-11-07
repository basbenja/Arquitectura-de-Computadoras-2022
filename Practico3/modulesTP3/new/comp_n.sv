module comp_n
    #(parameter N = 64) 
    (input logic [N-1:0] n1, n2,
    output logic equal);

    assign equal = (n1 === n2);
endmodule