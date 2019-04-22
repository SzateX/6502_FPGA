`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:46:56 04/19/2019
// Design Name:   cpu_core
// Module Name:   E:/FPGA/CPU/cpu_core_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_core
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_core_test;

	// Inputs
	reg [7:0] ROM [0:100];
	reg clk;
	reg [7:0] din;
	reg reset;

	// Outputs
	wire [15:0] addr;
	wire clk_out;
	wire [7:0] a_out;
	wire [7:0] x_out;
	wire [7:0] y_out;
	wire [7:0] opcode_out;
	wire [15:0] pc_out;
	wire [3:0] opcode_state_out;
	wire[7:0] alu_opcode_out;
	wire[7:0] alu_out_out;
	wire alu_cout_out;

	// Instantiate the Unit Under Test (UUT)
	cpu_core uut (
		.clk(clk), 
		.din(din), 
		.addr(addr), 
		.clk_out(clk_out), 
		.a_out(a_out), 
		.x_out(x_out), 
		.y_out(y_out),
		.reset(reset),
		.opcode_out(opcode_out),
		.pc_out(pc_out),
		.opcode_state_out(opcode_state_out),
		.alu_opcode_out(alu_opcode_out),
		.alu_out_out(alu_out_out),
		.alu_cout_out(alu_cout_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		/*ROM[0] = 8'hA9;
		ROM[1] = 8'd3;
		ROM[2] = 8'h69;
		ROM[3] = 8'd3;
		ROM[4] = 8'h69;
		ROM[5] = 8'd4;*/
		ROM[0] = 8'hA9; //LDA, #3
		ROM[1] = 8'h03; 
		ROM[2] = 8'h38; //SEC
		ROM[3] = 8'hE9; //SBC, #2
		ROM[4] = 8'h02; 
		ROM[5] = 8'h18; //CLC
		ROM[6] = 8'h69; //ADC, #4
		ROM[7] = 8'h04; 
		ROM[8] = 8'h29; //AND, #5
		ROM[9] = 8'h05;
		ROM[10] = 8'h49; //EOR, #6
		ROM[11] = 8'h06; 
		ROM[12] = 8'h09; //OR, #7
		ROM[13] = 8'h07;
		ROM[14] = 8'hAA; //TAX
		ROM[15] = 8'hA8; //TAY
		ROM[16] = 8'hA2; //LDX #$15
		ROM[17] = 8'h15;
		ROM[18] = 8'h8A; //TXA
		ROM[19] = 8'h98; //TYA
		ROM[20] = 8'hE8; //INX
		ROM[21] = 8'hC8; //INY
		ROM[22] = 8'hXA; //DEX
		ROM[23] = 8'h88; //DEY
		din = ROM[0];

		// Wait 100 ns for global reset to finish
		#100;
      //$monitor($time, ": A=%b X=%b Y=%b opcode=%b, pc=%b opstate=%b, addr=%b, aluop=%b, alu_out=%b, data_in=%d", 
		//a_out, x_out, y_out, opcode_out, pc_out, opcode_state_out, addr, alu_opcode_out, alu_out_out, din);
		$monitor($time, ": A=%h X=%h Y=%h c=%b opcode=%h", a_out, x_out, y_out, alu_cout_out, opcode_out);
		// Add stimulus here
		repeat(1000)
		begin
			#5 clk = ~clk;
		end
	end
	
	always @(addr)
	begin
		din = ROM[addr];
	end
      
endmodule

