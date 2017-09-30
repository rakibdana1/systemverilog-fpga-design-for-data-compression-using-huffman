`timescale 1ns / 1ps  //http://vlsi.pro/verilog-timescales/

//////////////////////////////////////////////////////////////////////////////////
// Count character frequency in stringIn and return counted frequencies in freq
// Each character is of 7 bit. There are total 13 characters in the stringIn
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module count_characters(CLK,nRST,stringIn,freq,characters);
	input CLK;
	input nRST;
	input [90:0] stringIn;
	output [6:0] characters[0:6];// 7 types of characters
	output [6:0] freq[0:6];// Frequencies for 7 types of characters
	
	reg [6:0] freq[0:6];
	reg [6:0] characters[0:6];
	reg [6:0] temp_character;
	integer i;
	 
	always @ (posedge CLK or negedge nRST)begin
	 	if(~nRST)begin
			for(i=0;i<7;i=i+1) begin
					freq[i]= 7'd0;
			end
			temp_character= 7'd0;
		end 
		else begin
			for(i=0;i<7;i=i+1) begin
					freq[i]= 7'd0;
			end
			characters[0] = 7'b111_0000;
			characters[1] = 7'b110_1000;
			characters[2] = 7'b010_0000;
			characters[3] = 7'b110_0001;
			characters[4] = 7'b110_1001;
			characters[5] = 7'b110_1111;
			characters[6] = 7'b111_1001;

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
				7'b111_0000: freq[0]++;
				7'b110_1000: freq[1]++;
				7'b010_0000: freq[2]++;
				7'b110_0001: freq[3]++;
				7'b110_1001: freq[4]++;
				7'b110_1111: freq[5]++;
				7'b111_1001: freq[6]++;
				default:;
				endcase
			end
		end
	end	
endmodule
