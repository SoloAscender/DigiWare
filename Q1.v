module sync_counter(clk, reset, count);
  input clk, reset;
  output reg count [3:0];
  
  always @(posedge clk)
    begin
      if(reset)
        count = 4'b0000;
      else
        count = count + 4'b0001;
    end
  
endmodule
