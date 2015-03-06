/*

Module: TripleDES_Encryption
Inputs:
Output: 
Modules Used: 

*/

module TripleDES_Encryption(data_in, data_out, key_1, key_2, key_3);
  input [63:0] data_in;
  input [63:0] key_1, key_2, key_3;
  output [63:0] data_out;
  
  wire [63:0] E1_out, D2_out;
  
  Encryption_DES E1(.data_in(data_in), .encryption_key(key_1), .data_out(E1_out) );
  Decryption_DES D2(.data_in(E1_out), .decryption_key(key_2), .data_out(D2_out) );
  Encryption_DES E3(.data_in(D2_out), .encryption_key(key_3), .data_out(data_out) );
  

endmodule