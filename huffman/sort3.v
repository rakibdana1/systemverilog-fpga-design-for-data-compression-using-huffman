`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort the symbol frequency array
// freq: 7 bit frequency array of 3 characters.
//
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module sort3(CLK,nRST,freq,charsIn,idIn, sorted, charsOut,idOut);
	input	CLK;
	input	nRST;
	input[6:0] freq[0:2];
	input[6:0] charsIn[0:2];
	input[7:0] idIn[0:2];
	output[6:0] sorted[0:2];
	output[6:0] charsOut[0:2];
	output[7:0] idOut[0:2];

	integer i, j;
	reg [6:0] array[1:3];
	reg [6:0] arrayChar[1:3];
	reg [7:0] arrayid[1:3];
	reg[6:0] sorted[0:2];
	reg[6:0] charsOut[0:2];
	reg[7:0] idOut[0:2];
	reg [6:0] temp;
	reg [6:0] tempChar;
	reg [7:0] tempid;

always @(posedge CLK or negedge nRST) begin
	if(!nRST) begin
		for(i=1;i<4;i=i+1) begin
			array[i] <= 7'b000_0000;
			arrayChar[i] <= 7'b000_0000;
			arrayid[i] <= 7'b000_0000;
			sorted[i-1] <= 7'b000_0000;
			charsOut[i-1] <= 7'b000_0000;
			idOut[i-1] <= 8'b000_0000;
		end
		temp <= 7'b000_0000;
		tempChar <= 7'b000_0000;
		tempid <= 8'b000_0000;
	end
	else begin
		for (i = 1; i < 4; i=i+1) begin
			array[i] <= freq[i-1];// get the frequencies
			arrayChar[i] <= charsIn[i-1];// get the chars
			arrayid[i] <= idIn[i-1];// get the chars
		end
  		for (i = 3; i > 0; i = i - 1) begin
  			for (j = 1 ; j < i; j = j + 1) begin
				if (array[j] < array[j + 1]) begin
					temp = array[j];
					array[j] = array[j + 1];
					array[j + 1] = temp;
				// Sort associate char
					tempChar = arrayChar[j];
					arrayChar[j] = arrayChar[j + 1];
					arrayChar[j + 1] = tempChar;
				// sort id
					tempid = arrayid[j];
					arrayid[j] = arrayid[j + 1];
					arrayid[j + 1] = tempid;
				end 
			end
		end 
		for (i = 0; i < 3; i=i+1) begin
			sorted[i] <= array[3-i][6:0];
			charsOut[i] <= arrayChar[3-i];
			idOut[i] <= arrayid[3-i];
		end
	end
end
endmodule
