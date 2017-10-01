`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: sort4
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module sort2_tb;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] freq[0:1];
	reg [6:0] charsIn[0:1];

	// Outputs
	wire [6:0] sorted[0:1];
	wire [6:0] charsOut[0:1];

	// Instantiate the Unit Under Test (UUT)
	sort2 uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq), 
		.charsIn(charsIn),
		.sorted(sorted),
		.charsOut(charsOut)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		freq[0] = 8'd3;
		freq[1] = 8'd1;
	
		charsIn[0] = 8'd3;
		charsIn[1] = 8'd1;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule
