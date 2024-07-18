module siso_shift(data,clr,clk,out);
  
  input data,clr,clk;
  output out;
  reg [3:0] q;
  always @(posedge clk)
    if(clr==1)
      begin
        q <= 4'b0000;
      end
    else
      begin
        q <= q>>1;
        q[3] = data;
      end
  assign out = q[0];
  
endmodule
