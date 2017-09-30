`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Sort 2 input numbers using Bubble Sort and return result in SORT_RESULT
// node1 [7:0]: Bit 4~7: frequency, Bit 0~3: XXXX [Dont care]
// node2 [7:0]: Bit 4~7: frequency, Bit 0~3: XXXX [Dont care]

// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module sort2(CLK,nRST,node1,node2,new1,new2);
	input CLK;
	input nRST;
	input [7:0] node1;
	input [7:0] node2;
	output [7:0] new1;
	output [7:0] new2;
	
	reg [7:0] new1;
	reg [7:0] new2;
	
	always @ (posedge CLK or negedge nRST)
	begin 
		if(!nRST)
			begin
			new1 <= 8'b0;
			new2 <= 8'b0;
			end
		else
			begin
			new1 <= node1;
			new2 <= node2;
			if(node1[7:4] > node2[7:4])
				begin
				new1 <= node2;
				new2 <= node1;
				end
			else;
			end
	end
	
endmodule
