`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Compress input using Huffman Codes
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module coding(CLK,nRST,in,chars,code,codeLen,out,length);
	input CLK;
	input nRST;
	input [90:0] in;
	input [6:0] chars[0:6];
	input [6:0] code[0:6];
	input [6:0] codeLen[0:6];
	output [0:33] out;//h0563ac3af
	output length;

	reg [6:0] code[0:6]; //[6:0] max code length <= unique characters
	reg [6:0] codeLen[0:6];
	reg [6:0] chars[0:6];
	reg [6:0] temp_character;
	reg [0:33] out;
	integer length;
	integer i,j,k;
	 
	always @ (posedge CLK or negedge nRST)begin
	 	if(~nRST)begin
			temp_character= 7'd0;
			out= 34'd0;
		end 
		else begin
			j=0;
			k=90;

			for(i=0;i<13;i=i+1) begin
				temp_character= 7'd0;
				temp_character = in[k-:7];
				case(temp_character)
				chars[0]: out[j+:4]=code[0][4:0];
				chars[1]: out[j+:4]=code[1][4:0];
				chars[2]: out[j+:3]=code[2][3:0];
				chars[3]: out[j+:3]=code[3][3:0];
				chars[4]: out[j+:3]=code[4][3:0];
				chars[5]: out[j+:2]=code[5][2:0];
				chars[6]: out[j+:2]=code[6][2:0];
				default:;
				endcase
				case(temp_character)
				chars[0]: j= j+4;
				chars[1]: j= j+4;
				chars[2]: j= j+3;
				chars[3]: j= j+3;
				chars[4]: j= j+3;
				chars[5]: j= j+2;
				chars[6]: j= j+2;
				default:;
				endcase
				k=k-7;
			end
		end
		length=j;
	end	
endmodule
