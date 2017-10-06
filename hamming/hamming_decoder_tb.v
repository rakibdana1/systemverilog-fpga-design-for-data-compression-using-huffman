`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: hamming_encoder
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module hamming_decoder_tb;

	// Inputs
	reg CLK;
	reg nRST;

	// Outputs
	reg [1:58] in;
	wire [0:33] out;
	wire [0:7] errorFound;
	wire [2:0] errorIndex[0:7];//we have 8 hamming codes

	// Instantiate the Unit Under Test (UUT)
	hamming_decoder uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.in(in),
		.out(out),
		.error(errorFound),
		.error_index(errorIndex)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;

		// Valid code for data 0000
		//#0 in = 7'b000_0000;
		// InValid code for data 0000
		//#5 in = 7'b000_0001;
		
		// Valid code for data 1101
		// in = 7'b110_0110;
		// InValid code for data 1101
	 	in = 58'h1e0000000000000;//h34a5e0599802ccf

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;
	end
	parameter DELAY = 10;
	always 
		# DELAY CLK = ~CLK;

      
endmodule

