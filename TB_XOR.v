`timescale 1 ns/ 1 ps

module TB_XOR;
  
  reg clk;
  reg [3:0] c;
  reg [3:0] a;
  reg [3:0] b;
  
  initial
    clk = 1'b0;
    
  always
    #10 clk = ~clk;
    
  always @ (posedge clk) begin
    c <= a ^ b;
  end
  
  
  initial begin
    a <= 4'd8;
    b <= 4'd1;
    #10
    a <= 4'd4;
    b <= 4'd2;
  end
  
endmodule