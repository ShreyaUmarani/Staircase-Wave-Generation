//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:19 10/08/2022 
// Design Name: 
// Module Name:    Staircase_logic 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
	 
	 // Shreya_Umarani Staircase Logic

module Shreya_Staircase_logic(input clk,
			output reg[3:0] val);

	always @ (posedge clk) begin
		if(val[3] == 1)
			val <= 0;
		else
			val <= val+ val+1;
   	end

endmodule
