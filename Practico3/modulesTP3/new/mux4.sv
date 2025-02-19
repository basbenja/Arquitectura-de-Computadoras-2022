module mux4 #(parameter N = 64)
             (input logic [N-1:0] d0, d1, d2, d3,
             input logic [1:0] s,
             output logic [N-1:0] y);
    
    assign y = s[1] ? (s[0] ? d3 : d2)
                    : (s[0] ? d1 : d0);

    // Another option
    // mux2 #(N) mux_up(d0, d1, s[0], y_up);
    // mux2 #(N) mux_up(d2, d3, s[0], y_down);
    // mux2 #(N) mux_final(y_up, y_down, s[1], y);
endmodule