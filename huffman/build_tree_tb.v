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
	reg [7:0] id[0:6];
	// Outputs
	wire [23:0] nodes[0:12];
	reg done;

	// Instantiate the Unit Under Test (UUT)
	build_tree uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.freq(freq),
		.chars(chars), 
		.id(id),
		.nodes(nodes),
		.done(done)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		freq[0] = 7'd1;
		freq[1] = 7'd1;
		freq[2] = 7'd1;
		freq[3] = 7'd1;
		freq[4] = 7'd2;
		freq[5] = 7'd3;
		freq[6] = 7'd4;
		chars[0] = 7'b1111001;//y
		chars[1] = 7'b1101111;//o
		chars[2] = 7'b1101001;//i
		chars[3] = 7'b1100001;//a
		chars[4] = 7'b0100000;// 
		chars[5] = 7'b1101000;//h
		chars[6] = 7'b1110000;//p
		id[0] = 8'd1;
		id[1] = 8'd2;
		id[2] = 8'd3;
		id[3] = 8'd4;
		id[4] = 8'd5;
		id[5] = 8'd6;
		id[6] = 8'd7;
		#10;
		nRST = 1;
	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK;
      
endmodule

