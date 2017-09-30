`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Generate a new tree is to generate the optimal huffman tree
// weight_Gather: sorted frequencies of 4 symbols
// Mohammad Rakib
// M. Engg. ICT, IICT
//////////////////////////////////////////////////////////////////////////////////

module generate_tree(CLK,nRST,weight_Gather,info_node_1,info_node_2,info_node_3,info_node_4,
info_node_5,info_node_6,info_node_7);
	input CLK;
	input nRST;
	input [31:0] weight_Gather;
	output [12:0] info_node_1;
	output [12:0] info_node_2;
	output [12:0] info_node_3;
	output [12:0] info_node_4;
	output [12:0] info_node_5;
	output [12:0] info_node_6;
	output [12:0] info_node_7;

	// To get sum of frequency -> New nodes in the huffman tree
	wire [7:0] node_new1;
	wire [7:0] node_new2;
	wire [7:0] node_new3;
	
	//to calculate temp frequencies in huffman tree
	wire [7:0] temp1; 
	wire [7:0] temp2;
	wire [7:0] temp3;
	wire [7:0] temp4;
	wire [7:0] temp5;
	wire [7:0] temp6;
	
	// temporary sorted frequency list(queue)
	wire [7:0] new1; 
	wire [7:0] new2;
	wire [7:0] new3;
	
	wire [3:0] S0;
	wire [3:0] S1;
	wire [3:0] S2;
	
	assign S0[3:0] = 4'b0000;     	assign S1[3:0] = 4'b0001;      
	assign S2[3:0] = 4'b0010;   
   
	// get sorted frequencies in the net (1,1,2,3)
	assign temp1[7:0] = weight_Gather[7:0]; // Least frequent
	assign temp2[7:0] = weight_Gather[15:8];
	assign temp3[7:0] = weight_Gather[23:16];
	assign temp4[7:0] = weight_Gather[31:24]; //Most frequent

	// Add two least frequncy temp1, temp2 and store it in node_new1
	add_model add_1(
		.CLK(CLK),
		.nRST(nRST),
		.ADD_1(temp1[7:4]),
		.ADD_2(temp2[7:4]),
		.SUM(node_new1[7:4])
	);
	assign node_new1[3:0] = node_new1[7:4]; //Bit 4~7: frequency, Bit 0~3: XXXX [Dont care]
	
	// Sort new 3 frequencies: 2,3,2 and store them new1,new2,new3
	sort3 s3(
		.CLK(CLK),
		.nRST(nRST),
		.node1(node_new1[7:0]),
		.node2(temp3[7:0]),
		.node3(temp4[7:0]),
		.new1(new1[7:0]),
		.new2(new2[7:0]),
		.new3(new3[7:0])
	);

	// Add two least frequncy new1, new2 and store it in node_new2
	add_model add_2(
		.CLK(CLK),
		.nRST(nRST),
		.ADD_1(new1[7:4]),
		.ADD_2(new2[7:4]),
		.SUM(node_new2[7:4])
	);
	assign node_new2[3:0] = node_new2[7:4];//Bit 4~7: frequency, Bit 0~3: XXXX [Dont care]. Do we really need this assignment??

	// Sort new 2 frequencies: 4,3 and store them new3, temp5, temp6
	sort2 s2_2(
		.CLK(CLK),
		.nRST(nRST),
		.node1(node_new2),
		.node2(new3),
		.new1(temp5),
		.new2(temp6)
	
	);
	
	// Add two least frequncy temp5 temp6 and store it in node_new3
	add_model add_3(
		.CLK(CLK),
		.nRST(nRST),
		.ADD_1(temp5[7:4]),
		.ADD_2(temp6[7:4]),
		.SUM(node_new3[7:4])
	);
	assign node_new3[3:0] = node_new3[7:4]; //Bit 4~7: frequency, Bit 0~3: XXXX [Dont care]
	
	assign info_node_1 = {S0[3:0],1'b0,temp1[7:0]}; //A
	assign info_node_2 = {S0[3:0],1'b1,temp2[7:0]}; //C
	assign info_node_3 = {S1[3:0],1'b0,new1[7:0]};  //2
	assign info_node_4 = {S1[3:0],1'b1,new2[7:0]};  //B
	assign info_node_5 = {S2[3:0],1'b0,temp5[7:0]}; //D
	assign info_node_6 = {S2[3:0],1'b1,temp6[7:0]}; //4
	assign info_node_7 = {5'b1_1111,node_new3[7:0]};//7
	
endmodule
