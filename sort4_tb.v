`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: sort4
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module sort4_tb;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] freq[0:3];

	// Outputs
	wire [6:0] sorted[0:3];

	// Instantiate the Unit Under Test (UUT)
	sort4 uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq), 
		.sorted(sorted)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		freq[0] = 8'd1;
		freq[1] = 8'd3;
		freq[2] = 8'd4;
		freq[3] = 8'd2;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule

