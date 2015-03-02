/*

Module: Core_Halfer
Input: 64-bit inupt
Output: Two 32-bit outputs, splitting the input in two 
Modules Used: N/A

*/

`timescale 1 ns/ 1 ps

module Core_Halfer(in, out_upper, out_lower);
  input [63:0] in;
  output [31:0] out_upper;
  output [31:0] out_lower;
  
  assign out_upper = in[63:32];
  assign out_lower = in[31:0];
  
endmodule
