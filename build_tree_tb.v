`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for module: generate_tree
//
// Mohammad Rakib
// M. Engg. ICT, IICT
////////////////////////////////////////////////////////////////////////////////

module generate_tree_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg [31:0] weight_Gather;

	// Outputs
	wire [12:0] info_node_1;
	wire [12:0] info_node_2;
	wire [12:0] info_node_3;
	wire [12:0] info_node_4;
	wire [12:0] info_node_5;
	wire [12:0] info_node_6;
	wire [12:0] info_node_7;

	// Instantiate the Unit Under Test (UUT)
	generate_tree uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.weight_Gather(weight_Gather), 
		.info_node_1(info_node_1), 
		.info_node_2(info_node_2), 
		.info_node_3(info_node_3), 
		.info_node_4(info_node_4), 
		.info_node_5(info_node_5), 
		.info_node_6(info_node_6), 
		.info_node_7(info_node_7)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		weight_Gather = 32'b0011_1101_0010_1011_0001_1100_0001_1010;

		#100;
		nRST = 1;
		// Add stimulus here

	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK;
      
endmodule

