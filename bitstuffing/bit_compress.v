`timescale 1ns / 1ps  //http://vlsi.pro/verilog-timescales/

//////////////////////////////////////////////////////////////////////////////////
// Discard MSBs of input symbols and return the result in "out"
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

//logic [31: 0] a_vect
//a_vect[ 0 +: 8] // == a_vect[ 7 : 0]
//a_vect[15 -: 8] // == a_vect[15 : 8]
module bit_compress(CLK,nRST,in,out);
	input CLK;
	input nRST;
	input [103:0] in;//total 13 characters
	output [90:0] out;

	reg [103:0] in;
	reg [90:0] temp;
	integer i,j,k;
	 
	always @ (posedge CLK or negedge nRST)begin
	 	if(~nRST)begin
		end 
		else begin
			j=0;
			k=0;
			for(i=0;i<13;i=i+1) begin
				//k= k+1;
				temp[j+:7]= in[k+:7];
				j= j+7;
				k= k+8;
			end
		end
	end	
	assign out=temp;
endmodule
