`timescale 1 ns/ 1 ps

module Rotate_1(in, out);
  input [27:0] in;
  output [27:0] out;
  
  assign out = {in[26:0], in[27]};
  
endmodule