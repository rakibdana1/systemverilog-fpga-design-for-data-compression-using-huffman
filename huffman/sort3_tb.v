`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: sort3
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module sort3_tb;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] freq[0:2];
	reg [6:0] charsIn[0:2];
	reg [6:0] idIn[0:2];

	// Outputs
	wire [6:0] sorted[0:2];
	wire [6:0] charsOut[0:2];
	wire [6:0] idOut[0:2];

	// Instantiate the Unit Under Test (UUT)
	sort3 uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq), 
		.charsIn(charsIn),
		.idIn(idIn),
		.sorted(sorted),
		.charsOut(charsOut),
		.idOut(idOut)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		freq[0] = 8'd1;
		freq[1] = 8'd7;
		freq[2] = 8'd3;

		charsIn[0] = 8'd1;
		charsIn[1] = 8'd7;
		charsIn[2] = 8'd3;

		idIn[0] = 8'd1;
		idIn[1] = 8'd7;
		idIn[2] = 8'd3;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule
