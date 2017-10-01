`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: sort6
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module sort6_tb;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] freq[0:5];
	reg [6:0] charsIn[0:5];
	reg [6:0] idIn[0:5];

	// Outputs
	wire [6:0] sorted[0:5];
	wire [6:0] charsOut[0:5];
	wire [6:0] idOut[0:5];

	// Instantiate the Unit Under Test (UUT)
	sort6 uut (
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
		freq[3] = 8'd1;
		freq[4] = 8'd2;
		freq[5] = 8'd9;

		charsIn[0] = 8'd1;
		charsIn[1] = 8'd7;
		charsIn[2] = 8'd3;
		charsIn[3] = 8'd1;
		charsIn[4] = 8'd2;
		charsIn[5] = 8'd9;

		idIn[0] = 8'd1;
		idIn[1] = 8'd7;
		idIn[2] = 8'd3;
		idIn[3] = 8'd1;
		idIn[4] = 8'd2;
		idIn[5] = 8'd9;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule
