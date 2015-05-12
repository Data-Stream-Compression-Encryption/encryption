/*

Module:   TB_Triple_DES
Purpose:  Tests the 3DES Algorithm in accordance with the procedure described at
          http://people.csail.mit.edu/rivest/pubs/Riv85.txt

*/

`timescale 1 ns/ 1 ps

module TB_Triple_DES;
  
  reg clk;
  reg [63:0] X0, key1, key2, key3;
  wire [63:0] out;
  
  TripleDES_Encryption TripDES(.data_in(X0), .data_out(out), .key_1(key1), .key_2(key2), .key_3(key3));
  
  initial
    clk = 1'b1;
        
  always
    #5 clk = ~clk;
    
  initial begin
    X0 = 64'h9474B8E8C73BCA7D;
    key1 = 64'h9474B8E8C73BCA7D;
    key2 = 64'h8DA744E0C94E5E17;
    key3 = 64'h0CDB25E3BA3C6D79;
    
    #10
    X0 = 64'h4784C4BA5006081F;
    key1 = 64'h4784C4BA5006081F;
    key2 = 64'h1CF1FC126F2EF842;
    key3 = 64'hE4BE250042098D13;
    
    #10
    X0 = 64'h7BFC5DC6ADB5797C;
    key1 = 64'h7BFC5DC6ADB5797C;
    key2 = 64'h1AB3B4D82082FB28;
    key3 = 64'hC1576A14DE707097;
    
    #10
    X0 = 64'h739B68CD2E26782A;
    key1 = 64'h2A59F0C464506EDB;
    key2 = 64'hA5C39D4251F0A81E;
    key3 = 64'h7239AC9A6107DDB1;
  end
  
  
endmodule
