`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Encode input using Huffman Codes
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module coding(CLK,nRST,in,chars,code,codeLen,out,length);
	input CLK;
	input nRST;
	input [6:0] code[0:6];
	input codeLen[0:6];
	input [90:0] in;
	input [6:0] chars[0:6];
	output [33:0] out;
	output length;

	reg [6:0] code[0:6]; //[6:0] max code length <= unique characters
	integer codeLen[0:6];
	reg [33:0] temp;

	reg [3:0] code_y, code_o;
	reg [2:0] code_i, code_a, code_sp;
	reg [1:0] code_h, code_p;
	reg [6:0] chars[0:6];
	reg [6:0] temp_character;
	integer length;
	integer i,j,k;
	 
	always @ (posedge CLK or negedge nRST)begin
	 	if(~nRST)begin
			temp_character= 7'd0;
			temp= 34'd0;
		end 
		else begin
			code_y=code[0][4:0];
			code_o=code[1][4:0];
			code_i=code[2][3:0];
			code_a=code[3][3:0];
			code_sp=code[4][3:0];
			code_h=code[5][2:0];
			code_p=code[6][2:0];
			j=0;
			k=0;

			for(i=0;i<13;i=i+1) begin
				temp_character= 7'd0;
				temp_character = in[k+:7];
				case(temp_character)
				chars[0]: temp[j+:4]=code_y;
				chars[1]: temp[j+:4]=code_o;
				chars[2]: temp[j+:3]=code_i;
				chars[3]: temp[j+:3]=code_a;
				chars[4]: temp[j+:3]=code_sp;
				chars[5]: temp[j+:2]=code_h;
				chars[6]: temp[j+:2]=code_p;
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
				k= k+7;
			end
		end
		length=j;
	end
	assign out=temp;
endmodule
