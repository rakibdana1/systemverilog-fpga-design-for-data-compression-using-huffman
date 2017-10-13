`timescale 1ns / 1ps  //http://vlsi.pro/verilog-timescales/
//////////////////////////////////////////////////////////////////////////////////
// Bit decompression and return the result in "out"
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module bit_decompress(CLK,nRST,in,out);
	input CLK;
	input nRST;
	input [90:0] in;
	output [103:0] out;//h68697020686f70206861707079

	reg [90:0] in;
	reg [103:0] temp;
	integer i,j,k;
	 
	always @ (posedge CLK or negedge nRST)begin
	 	if(~nRST)begin
		end 
		else begin
			j=0;
			temp=0;
			k=0;
			for(i=0;i<13;i=i+1) begin
				temp[j+:7]= in[k+:7];
				j= j+8;
				k= k+7;
				temp[j]=1'b0;
			end
		end
	end	
	assign out=temp;
endmodule
