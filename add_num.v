`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Add two 7 bit numbers and return result in SUM(7 bit)
// Caution: SUM should be <= 127
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module add_num(CLK,nRST,NUM_1,NUM_2,SUM);
	input	CLK;
	input nRST;
	input [6:0] NUM_1;
	input	[6:0] NUM_2;
	output [6:0] SUM;	

	reg [6:0]sum_r ;

	always@(posedge CLK or negedge nRST)
	begin
		if(!nRST)
			sum_r <= 7'b000_0000;
		else
			sum_r <= NUM_1 + NUM_2; 
	end
	assign  SUM = sum_r[6:0];
endmodule
