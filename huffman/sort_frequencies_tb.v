`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: sort_frequencies
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module sort_frequencies_tb;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] freq[0:6];
	reg [6:0] charsIn[0:6];

	// Outputs
	wire [6:0] sorted[0:6];
	wire [6:0] charsOut[0:6];

	// Instantiate the Unit Under Test (UUT)
	sort_frequencies uut (
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
		freq[0] = 7'd1;
		freq[1] = 7'd1;
		freq[2] = 7'd2;
		freq[3] = 7'd1;
		freq[4] = 7'd4;
		freq[5] = 7'd1;
		freq[6] = 7'd3;
		charsIn[0] = 7'd1;
		charsIn[1] = 7'd1;
		charsIn[2] = 7'd2;
		charsIn[3] = 7'd1;
		charsIn[4] = 7'd4;
		charsIn[5] = 7'd1;
		charsIn[6] = 7'd3;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule
