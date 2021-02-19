`timescale 1ns / 1ps
//Following link leads to the block diagram of the 6502, on which all registers are based
//Original creator of the diagram:  Donald F. Hanson
//Original document: https://projects.ncsu.edu/wcae//WCAE1/hanson.pdf
//https://www.witwright.com/DonPub/6502-Block-Diagram.pdf
//Most of the names of inputs/outputs corresponds to datapaths/markings on this schematic
//If any differences/special circumstances happen to arise, they should be explicitly noted "in place",
//as it is done in the following module

module reg_XY( //module for x and y registers
	//Possible to use as ADDRESS BUS, PRECODE register as well,
	//Just lock BUS_ENABLE high
	input wire LOAD,
	input wire BUS_ENABLE,
	input wire [7:0] DATA,
	output reg [7:0] OUT
	);

	reg [7:0] register;
	

	//@(*), means that evaluation happens if any of revelant signals gets changed
	always@(*)
	begin
		if(LOAD)
			register = DATA;
		if(BUS_ENABLE)
			OUT = register;
	end


endmodule


module reg_ACC( //module for accumulator register
	//prefix tells the name of source/target datapath
	input wire LOAD,
	input wire SB_BUS_ENABLE,
	input wire DB_BUS_ENABLE,
	input wire [7:0] DAA_DATA, //Data fed from Decimal Adjust Adders (DAA)
	output reg [7:0] SB_OUT,
	output reg [7:0] DB_OUT
	);

	reg [7:0] register;
	


	always@(*)
	begin
		if(LOAD)
			  register = DAA_DATA;
		if(SB_BUS_ENABLE)
			  SB_OUT = register;
		if(DB_BUS_ENABLE)
			  DB_OUT = register;
	end


endmodule


module reg_S( //module for Stack Pointer Register
	input wire RELOAD,
	input wire SB_LOAD,
	input wire SB_BUS_ENABLE,
	input wire ADL_BUS_ENABLE,
	input wire [7:0] SB_DATA,
	output reg [7:0] SB_OUT,
	output reg [7:0] ADL_OUT
   );

	reg [7:0] register;
	


	always@(*)
	begin
		if(SB_LOAD)
			register = SB_DATA;
		if(SB_BUS_ENABLE)
			SB_OUT = register;
		if(ADL_BUS_ENABLE)
			ADL_OUT = register;
		if(RELOAD)
			register = register;
	end

endmodule
