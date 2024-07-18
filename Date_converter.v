module date_converter(
input [4:0] date,
input [3:0] month,
input [11:0] year,
output reg [2:0] day
);


wire [2:0] year_code;
wire [2:0] month_code;
wire [2:0] century_code;
wire leapyear_code;


yearCode u0 (.year(year), .year_code(year_code));
monthCode u1 (.month(month), .month_code(month_code));
centuryCode u2 (.year(year), .century_code(century_code));
leapyearCode u3 (.year(year), .month(month), .leapyear_code(leapyear_code));


always @* begin
day = (year_code + month_code + century_code + date - leapyear_code) % 7;
end


endmodule


module yearCode(
input [11:0] year,
output reg [2:0] year_code);
reg [6:0] YY;
always @(*) begin
YY = year % 100;
year_code = (YY + (YY/4)) % 7;
end
//$display("year: %d, year_code = %d", year, year_code);
endmodule


module monthCode(
input [3:0] month,
output wire [2:0] month_code
);
assign month_code = (month == 4'd1) ? 3'b000 :
(month == 4'd2) ? 3'b011 :
(month == 4'd3) ? 3'b011 :
(month == 4'd4) ? 3'b110 :
(month == 4'd5) ? 3'b001 :
(month == 4'd6) ? 3'b100 :
(month == 4'd7) ? 3'b110 :
(month == 4'd8) ? 3'b010 :
(month == 4'd9) ? 3'b101 :
(month == 4'd10) ? 3'b000 :
(month == 4'd11) ? 3'b011 :
(month == 4'd12) ? 3'b101 : 3'b000;


//initial $display("Month: %d, month_code = %b", month, month_code);
endmodule






module centuryCode(
input [11:0] year,
output reg [2:0] century_code);
wire [6:0] century;
assign century = year / 100;
always @(*) begin
case(century)
7'd17:century_code = 4;
7'd18:century_code = 2;
7'd19:century_code = 0;
7'd20:century_code = 6;
7'd21:century_code = 4;
7'd22:century_code = 2;
7'd23:century_code = 0;
endcase
end


//$display("year: %d, century_code = %d", year, century_code);
endmodule


module leapyearCode(
input [11:0] year,
input [3:0] month,
output reg leapyear_code
);
reg leap_year_check;
always@(*) begin
if(year%4 == 0) begin
if(year % 100 == 0 && year % 400 != 0)
leap_year_check = 0;
else leap_year_check = 1;
end else begin
leap_year_check = 0;
end
end


always @(*) begin
leapyear_code = leap_year_check?((month == 4'd1 || month == 4'd2)?1:0):0;
end


//$display("year: %d, leapyear_code = %d", year, leapyear_code);
endmodule
