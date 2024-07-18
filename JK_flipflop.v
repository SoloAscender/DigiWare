module JK_flipflop(J, K, CLK, Q, Qbar);
  
  input J, K, CLK;
  output reg Q, Qbar;
  
  initial Q = 0;
  
  always@(posedge CLK)
    begin
      case({J,K})
        2'b00 : Q <= Q;
        2'b01 : Q <= 0;
        2'b10 : Q <= 1;
        2'b11 : Q <= ~Q;
      endcase 
      Qbar = ~Q;
    end
  
endmodule  