module moore_machine(inp, clk, reset, z);
  input inp,clk,reset;
  output reg z;
  
  parameter A=1, B=0;
  
  reg PS, NS;
  
  always @(posedge clk or posedge reset)
    if(reset) PS <= B;
    else  PS <= A;
  
  always @(PS,inp)
    case(PS)
      B : begin
        z = inp ? 1 : 0;
        NS = inp ? B : A;
      end
      
      A : begin
        z = inp ? 0 : 1;
        NS = inp ? A : B;
      end
    endcase
endmodule
