`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for generate_code.v
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module generate_code_test;

	// Inputs
	reg CLK;
	reg nRST;
	reg [6:0] chars[0:6];
	reg [23:0] nodes[0:12]; // total characters

	// Outputs
	wire [6:0] code[0:6]; //[6:0] max code length <= unique characters
	wire [6:0] codeLen[0:6];

	// Instantiate the Unit Under Test (UUT)
	generate_code uut (
		.CLK(CLK), 
		.nRST(nRST), 
		.nodes(nodes), 
		.characters(chars), 
		.code(code), 
		.codeLen(codeLen)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		nRST = 0;
		chars[0] = 7'b1111001;//y
		chars[1] = 7'b1101111;//o
		chars[2] = 7'b1101001;//i
		chars[3] = 7'b1100001;//a
		chars[4] = 7'b0100000;// 
		chars[5] = 7'b1101000;//h
		chars[6] = 7'b1110000;//p

/*              |   23 --- 16   |   15   |  14 --- 7  | 6 --- 0
/*              |    0-255      |   0-1  |   0-255    |  0-127
/*              | parent number | 0 or 1 | node_id    | character
******************************************************************/

		nodes[0] = 24'h0880f9;
		nodes[1] = 24'h08016f;
		nodes[2] = 24'h098261;
		nodes[3] = 24'h0901e9;
		nodes[4] = 24'h0a847f;
		nodes[5] = 24'h0a02a0;
		nodes[6] = 24'h0b84ff;
		nodes[7] = 24'h0b0368;
		nodes[8] = 24'h0c857f;
		nodes[9] = 24'h0c03f0;
		nodes[10] = 24'hff867f;
		nodes[11] = 24'hff05ff;
		nodes[12] = 24'h00ffff;

		// Wait 10 ns for global reset to finish
		#10;
        nRST = 1;

	end
	parameter DELAY = 1;
	always
		#DELAY CLK = ~CLK; 
      
endmodule

