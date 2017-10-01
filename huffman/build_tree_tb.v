`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: generate_tree
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module build_tree_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] freq[0:6];
	reg [6:0] chars[0:6];

	// Outputs
	wire [23:0] nodes[0:12];

	// Instantiate the Unit Under Test (UUT)
	build_tree uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq),
		.chars(chars), 
		.nodes(nodes)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		freq[0] = 7'd4;
		freq[1] = 7'd3;
		freq[2] = 7'd2;
		freq[3] = 7'd1;
		freq[4] = 7'd1;
		freq[5] = 7'd1;
		freq[6] = 7'd1;
		chars[0] = 7'b111_0000;
		chars[1] = 7'b110_1000;
		chars[2] = 7'b010_0000;
		chars[3] = 7'b110_0001;
		chars[4] = 7'b110_1001;
		chars[5] = 7'b110_1111;
		chars[6] = 7'b111_1001;

		#10;
		nRST = 1;
		// Add stimulus here

	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK;
      
endmodule

