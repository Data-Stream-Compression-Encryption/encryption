/*

Module: Rotate_1
Input: 28-bit input
Output: 28-bit output with 1-bit rotation of the input
Modules Used: N/A

*/

`timescale 1 ns/ 1 ps

module Rotate_1(in, out);
  input [27:0] in;
  output [27:0] out;
  
  assign out = {in[26:0], in[27]};
  
endmodule