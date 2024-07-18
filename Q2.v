module decimal_counter(clk, reset, enable, q);
  
  input clk, reset;
  output reg enable;
  output reg [15:0] q;
  reg carry = 0;
  
  always @(posedge clk or posedge reset)
    
    begin
      enable = 0;
      
      if(q[3:0]==4'b1001) 
        begin
          enable = 1;
          carry = 1;
          q[3:0] = 4'b0000;
        end
      else if(q[3:0]!=4'b1001) 
        begin
          q[3:0] = q[3:0] + 1;
        end
      
      if(q[7:4]+carry==4'b1010)
        begin
          carry = 1;
          q[7:4] = 4'b0000;
        end
      else if(q[7:4]+carry!=4'b1010)
        begin
          carry = 0;
          q[7:4] = q[7:4] + carry;
        end
      
      if(q[11:8]+carry==4'b1010)
        begin
          carry = 1;
          q[11:8] = 4'b0000;
        end
      else if(q[11:8]+carry!=4'b1010)
        begin
          carry = 0;
          q[11:8] = q[11:8] + carry;
        end
      
      if(q[15:12]+carry==4'b1010)
        begin
          q = 4'd0000;
        end
      else if(q[15:12]+carry!=4'b1010)
        begin
          carry = 0;
          q[15:12] = q[15:12] + carry;
        end
      
    end
  
endmodule

  
  