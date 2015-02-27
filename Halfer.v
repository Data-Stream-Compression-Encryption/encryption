/*

Module: Halfer
Input: 56-bit inupt
Output: Two 28-bit outputs, splitting the input in two 
Modules Used: N/A

*/

`timescale 1 ns/ 1 ps

module Halfer(in, out_upper, out_lower);
  input [55:0] in;
  output [27:0] out_upper;
  output [27:0] out_lower;
  
  assign out_upper = in[55:28];
  assign out_lower = in[27:0];
  
endmodule
