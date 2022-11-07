`timescale 1ns / 10ps

module imem_tb();
    logic [5:0] addr;
    logic [31:0] q, q_expected;
    logic [31:0] errors;

    imem #(32) dut(addr, q);
		
	logic [31:0] ROM_expected [0:49] = '{default:32'h0};
    initial begin		
		ROM_expected [0:46] =  '{
			32'hf8000001, 32'hf8008002, 32'hf8000203, 32'h8b050083,
			32'hf8018003, 32'hcb050083, 32'hf8020003, 32'hcb0a03e4,
			32'hf8028004, 32'h8b040064, 32'hf8030004, 32'hcb030025,
			32'hf8038005, 32'h8a1f0145, 32'hf8040005, 32'h8a030145,
			32'hf8048005, 32'h8a140294, 32'hf8050014, 32'haa1f0166,
			32'hf8058006, 32'haa030166, 32'hf8060006, 32'hf840000c,
			32'h8b1f0187, 32'hf8068007, 32'hf807000c, 32'h8b0e01bf,
			32'hf807801f, 32'hb4000040, 32'hf8080015, 32'hf8088015,
			32'h8b0103e2, 32'hcb010042, 32'h8b0103f8, 32'hf8090018,
			32'h8b080000, 32'hb4ffff82, 32'hf809001e, 32'h8b1e03de,
			32'hcb1503f5, 32'h8b1403de, 32'hf85f83d9, 32'h8b1e03de,
			32'h8b1003de, 32'hf81f83d9, 32'hb400001f };
    end

    initial begin
        errors = 0; q_expected = 0;
        for (addr = 6'b0; addr < 6'd50; addr++) begin
            q_expected = ROM_expected[addr]; #1;
            if (q != q_expected) begin
                $display("Error in address %d", addr);
                $display("output: %h, expected: %h", q, q_expected);
                errors++;
            end
        end
        $display("%d tests completed with %d errors", addr, errors);
        $stop;
    end
endmodule
