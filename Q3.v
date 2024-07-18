module rotator(clk, load, enable, data, q);
  
  input clk, load;
  input [1:0] enable;
  input [99:0] data;
  
  output reg [99:0] q;
  
  reg temp;
  integer i;
  
  always @(posedge clk) 
    begin
      if(load)
        q <= data;
      else
        begin
          case(enable)
            2'b00 : q = q;
            2'b11 : q = q;
            2'b01 : begin
              temp = q[99];
              for(i=99; i>0; i=i-1) begin
                q[i] <= q[i-1];
              end
              q[0] = temp;
            end
            2'b10 : begin
              temp = q[0];
              for(i=0; i<99; i=i+1) begin
                q[i] <= q[i+1];
              end
              q[99] = temp;
            end
          endcase  
        end
    end
  
endmodule

              
              
  