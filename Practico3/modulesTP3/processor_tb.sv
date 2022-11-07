// Testbench ProcessorPatterson
// Top-level Entity: processor_arm

module processor_tb();
	localparam  N = 64;
	logic        	CLOCK_50, reset;
	logic        	DM_writeEnable;
	logic [N-1:0] 	DM_writeData, DM_addr;
	logic 			dump;
	logic			ExtIRQ, ExtIAck;

  // instantiate device under test
  processor_arm  dut (.CLOCK_50(CLOCK_50), 
  					.reset(reset), 
					.ExtIRQ(ExtIRQ), 
					.ExtIAck(ExtIAck),
					.DM_writeData(DM_writeData), 
					.DM_addr(DM_addr), 
					.DM_writeEnable(DM_writeEnable), 
					.dump(dump));

  // generate clock
  always     // no sensitivity list, so it always executes
    begin
      #5 CLOCK_50 = ~CLOCK_50; 
    end

	// 4 hardware exceptions
	initial begin
		ExtIRQ = 0;
		#50  ExtIRQ = 1;
		#10  ExtIRQ = 0;
		#650 ExtIRQ = 1;
		#10  ExtIRQ = 0;
		#70  ExtIRQ = 1;
		#10  ExtIRQ = 0;
		#650 ExtIRQ = 1;
		#10  ExtIRQ = 0;
	end

  initial
    begin
      CLOCK_50 = 0; reset = 1; dump = 0;
      #20 reset = 0; 
      #15000 dump = 1; 
	  #20 $stop;
	end 
endmodule
