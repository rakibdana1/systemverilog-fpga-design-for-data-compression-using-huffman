`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort the symbol frequency array
// FREQUENT_IN: 16 bit frequency array of 4 symbols. Each frequency stored in subsequent 4 bits.
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module sort_frequent(CLK,nRST,FREQUENT_IN,FREQUENT_OUT);
	input CLK;
	input nRST;
	input [15:0] FREQUENT_IN;
	output [31:0] FREQUENT_OUT;
	 
	//[7:0] means we're using the little-endian convention - start with 0 at the rightmost bit to begin the vector, then move to the left.
	wire [7:0] freq_A;
	wire [7:0] freq_B;
	wire [7:0] freq_C;
	wire [7:0] freq_D;
	
	assign freq_A[7:0] = {FREQUENT_IN[3:0],4'b1010};
	assign freq_B[7:0] = {FREQUENT_IN[7:4],4'b1011};
	assign freq_C[7:0] = {FREQUENT_IN[11:8],4'b1100};
	assign freq_D[7:0] = {FREQUENT_IN[15:12],4'b1101};
	
	bubble_sort sort(
		.CLK(CLK),
		.nRST(nRST),
		.freq_A(freq_A),
		.freq_B(freq_B),
		.freq_C(freq_C),
		.freq_D(freq_D),
		.SORT_RESULT(FREQUENT_OUT[31:0])
	);
	
endmodule
