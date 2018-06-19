`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2018 03:50:12 PM
// Design Name: 
// Module Name: setup
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module setup(clk, reset, DAC);

    input clk, reset;
    output reg [9:0] DAC;
    
    always @(posedge clk, posedge reset) begin
        if(reset) begin
            DAC <= 0;
        end
        else begin
            DAC <= 10'b1011000000;
        end
    end

endmodule
