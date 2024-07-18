module full_adder(A,B,cin,sum,cout);

  input [3:0] A,B;
  input cin;
  output reg [3:0] sum;
  output reg cout;
  
  always @(A or B or cin) begin
    {cout,sum} = A + B + cin;
  end
  
endmodule