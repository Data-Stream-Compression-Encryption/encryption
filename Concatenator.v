/*

Module: Concatenator
Input: Two 28-bit inputs
Output: One 56-bit output
Modules Used: N/A

*/

`timescale 1 ns/ 1 ps

module Concatenator(in_upper, in_lower, out);
  input [27:0] in_upper;
  input [27:0] in_lower;
  output [55:0] out;
  
  assign out = {in_upper, in_lower};

endmodule
