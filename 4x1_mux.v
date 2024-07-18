module mux_4x1(a,b,c,d,sel,F);
  
  input a,b,c,d;
  input [1:0] sel;
  output reg F;
  
  always @(*) begin
    if(sel == 2'b00)
      F = a;
    else if(sel == 2'b01)
      F = b;
    else if(sel == 2'b10)
      F = c;
    else if(sel == 2'b11)
      F = d;
  end  
    
endmodule  