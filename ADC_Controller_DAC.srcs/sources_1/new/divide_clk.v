`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2018 02:08:27 PM
// Design Name: 
// Module Name: divide_clk
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


module divide_clk(fin, rst, f16);
 
 input fin, rst;
 output reg f16;
 reg q1, q2, q3, q4, f2, f8, f4;

 always @ (posedge fin, posedge rst)
  begin
   if (rst)
    f2 = 1'b0;
   
   else
   begin 
    q1 = ~f2;
    f2 = q1;
   end
  end

 always @ (posedge q1, posedge rst)
  begin
   if (rst)
    f4 = 1'b0;
   
   else
   begin 
    q2 = ~f4;
    f4 = q2;
   end
  end

  always @ (posedge q2, posedge rst)
  begin
   if (rst)
    f8 = 1'b0;
   
   else
   begin 
    q3 = ~f8;
    f8 = q3;
   end
  end

 always @ (posedge q3, posedge rst)
  begin
   if (rst)
    f16 = 1'b0;
   
   else
   begin 
    q4 = ~f16;
    f16 = q4;
   end
  end

endmodule