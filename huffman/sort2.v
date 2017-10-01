`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort 2 input numbers in freq[2] array and return result in 'sorted'
// sorted[1][0]: [Most frequent][Least frequent]
// Caution: Each frequency should be 7 bits.
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module sort2(CLK,nRST,freq,charsIn,idIn,sorted, charsOut,idOut);
	input	CLK;
	input	nRST;
	input[6:0] freq[0:1];
	input[6:0] charsIn[0:1];
	input[7:0] idIn[0:1];
	output[6:0] sorted[0:1];
	output[6:0] charsOut[0:1];
	output[7:0] idOut[0:1];
	
	reg [6:0] sorted[0:1];
	reg [6:0] charsOut[0:1];
	reg [7:0] idOut[0:1];
	
	always @ (posedge CLK or negedge nRST)
	begin 
		if(!nRST) begin
			sorted[0] <= 7'b0;
			sorted[1] <= 7'b0;
		end
		else begin
			sorted[0] <= freq[0];
			sorted[1] <= freq[1];
			charsOut[0] <= charsIn[0];
			charsOut[1] <= charsIn[1];
			idOut[0] <= idIn[0];
			idOut[1] <= idIn[1];
			if(freq[0] > freq[1]) begin //If right num is greater then swap
				sorted[0] <= freq[1];
				sorted[1] <= freq[0];
				charsOut[0] <= charsIn[1];
				charsOut[1] <= charsIn[0];
				idOut[0] <= idIn[1];
				idOut[1] <= idIn[0];
			end
		end	
	end
	
endmodule
