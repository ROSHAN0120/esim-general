module mult4bits_tb();
   reg[3:0]a,b;
   wire[7:0]p;

mult4bits  m(a,b,p);

initial
begin
  a=0; b=0;
end
initial
begin
  #5;
  a=4'b0011;b=4'd3;
  #5;
  a=7;         b=1;
  #5;
  a=4'b0101;   b=4'd5;
  #5;
  a=4'hA;     b=4'hA;
  #5;
  a=9;         b=15;
  #5;
end
endmodule