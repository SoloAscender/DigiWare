module T_flipflop(T, CLK, Q, Qbar);
  
  input T, CLK;
  output reg Q, Qbar;
  
  initial Q=0;
  
  always@(posedge CLK)
    begin
      if(T==0)
        Q <= Q;
      else
        Q <= ~Q;
    end
    assign Qbar <= ~Q;    
        
  
endmodule  