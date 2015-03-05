/*

Module:   TB_DES
Purpose:  Tests the DES Algorithm in accordance with the procedure described at
          http://people.csail.mit.edu/rivest/pubs/Riv85.txt

*/

`timescale 1 ns/ 1 ps

module TB_DES;
  
  reg clk;
  reg [63:0] X0;
  reg [63:0] out;
  
  wire [63:0] X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16;
 
  Encryption_DES Encrypt1 ( .data_in(X0), .encryption_key(X0), .data_out(X1) );
  
  Decryption_DES Decrypt2 ( .data_in(X1), .decryption_key(X1), .data_out(X2) );
  
  Encryption_DES Encrypt3 ( .data_in(X2), .encryption_key(X2), .data_out(X3) );
  
  Decryption_DES Decrypt4 ( .data_in(X3), .decryption_key(X3), .data_out(X4) );
  
  Encryption_DES Encrypt5 ( .data_in(X4), .encryption_key(X4), .data_out(X5) );
  
  Decryption_DES Decrypt6 ( .data_in(X5), .decryption_key(X5), .data_out(X6) );
  
  Encryption_DES Encrypt7 ( .data_in(X6), .encryption_key(X6), .data_out(X7) );
  
  Decryption_DES Decrypt8 ( .data_in(X7), .decryption_key(X7), .data_out(X8) );
  
  Encryption_DES Encrypt9 ( .data_in(X8), .encryption_key(X8), .data_out(X9) );
  
  Decryption_DES Decrypt10 ( .data_in(X9), .decryption_key(X9), .data_out(X10) );
  
  Encryption_DES Encrypt11 ( .data_in(X10), .encryption_key(X10), .data_out(X11) );
  
  Decryption_DES Decrypt12 ( .data_in(X11), .decryption_key(X11), .data_out(X12) );
  
  Encryption_DES Encrypt13 ( .data_in(X12), .encryption_key(X12), .data_out(X13) );
  
  Decryption_DES Decrypt14 ( .data_in(X13), .decryption_key(X13), .data_out(X14) );
  
  Encryption_DES Encrypt15 ( .data_in(X14), .encryption_key(X14), .data_out(X15) );
  
  Decryption_DES Decrypt16 ( .data_in(X15), .decryption_key(X15), .data_out(X16) );
  
  initial
    clk = 1'b0;
        
  always
    #10 clk = ~clk;
    
  initial begin
    X0 <= 64'h9474B8E8C73BCA7D;
    
  end
  
  
endmodule