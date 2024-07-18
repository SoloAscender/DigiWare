module comparator(a,b,l,e,g);
  
  input [2:0] a,b;
  output reg l,e,g;
  
  always @(a,b) begin
    
    if(a>b)
      begin
        g=1'b1; e=1'b0; l=1'b0;
      end
    else if(a<b)
      begin
        l=1'b1; e=1'b0; g=1'b0;
      end
    else
      begin
        e=1'b1; l=1'b0; g=1'b0;
      end
    
  end
  
endmodule
