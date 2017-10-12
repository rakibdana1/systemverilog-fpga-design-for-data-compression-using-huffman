`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generate Huffman Codes
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////
module coding(CLK,nRST,code,codeLen,compress,length);
	input CLK;
	input nRST;
	input [6:0] code[0:6];
	input [6:0] codeLen[0:6];
	output [0:33] compress;
	output length;

	reg [6:0] code[0:6]; //[6:0] max code length <= unique characters
	reg [6:0] codeLen[0:6];
	
	wire [90:0] stringIn;//reg??
	//Input: "hip hop happy"
	assign stringIn=91'b110_1000_110_1001_111_0000_010_0000_110_1000_110_1111_111_0000_010_0000_110_1000_110_0001_111_0000_111_0000_111_1001;
	reg [3:0] code_y, code_o;
	reg [2:0] code_i, code_a, code_sp;
	reg [1:0] code_h, code_p;
	reg [6:0] chars[0:6];
	reg [6:0] temp_character;
	reg [51:0] compress;
	integer length;
	integer i,j;
	 
	always @ (posedge CLK or negedge nRST)begin
	 	if(~nRST)begin
			temp_character= 7'd0;
			compress= 34'd0;
		end 
		else begin
			chars[0] = 7'b1111001;//y
			chars[1] = 7'b1101111;//o
			chars[2] = 7'b1101001;//i
			chars[3] = 7'b1100001;//a
			chars[4] = 7'b0100000;// 
			chars[5] = 7'b1101000;//h
			chars[6] = 7'b1110000;//p
			code_y=4'b1111;
			code_o=4'b1110;
			code_i=3'b010;
			code_a=3'b011;
			code_sp=3'b110;
			code_h=2'b00;
			code_p=2'b10;
			j=0;

			for(i=0;i<13;i=i+1) begin
				temp_character= 7'd0;
				case(i)
				0: temp_character = stringIn[6:0];
				1: temp_character = stringIn[13:7];
				2: temp_character = stringIn[20:14];
				3: temp_character = stringIn[27:21];
				4: temp_character = stringIn[34:28];
				5: temp_character = stringIn[41:35];
				6: temp_character = stringIn[48:42];
				7: temp_character = stringIn[55:49];
				8: temp_character = stringIn[62:56];
				9: temp_character = stringIn[69:63];
				10: temp_character = stringIn[76:70];
				11: temp_character = stringIn[83:77];
				12: temp_character = stringIn[90:84];
				default:;
				endcase

				case(temp_character)
				chars[0]: compress[j+:4]=code_y;
				chars[1]: compress[j+:4]=code_o;
				chars[2]: compress[j+:3]=code_i;
				chars[3]: compress[j+:3]=code_a;
				chars[4]: compress[j+:3]=code_sp;
				chars[5]: compress[j+:2]=code_h;
				chars[6]: compress[j+:2]=code_p;
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
			end
		end
		length=j;
	end	
endmodule
