module mult4bits (a,b,p);
input [3:0] a,b;
wire[3:0]m0;
wire[4:0]m1;
wire[5:0]m2;
wire[6:0]m3;
wire[7:0]s1,s2,s3;
output[7:0] p;
assign m0={4{b[0]}}&a[3:0];
assign m1={4{b[1]}}&a[3:0];
assign m2={4{b[2]}}&a[3:0];
assign m3={4{b[3]}}&a[3:0];
assign s1= m0+(m1<<1);
assign s2= s1+(m2<<2);
assign s3= s2+(m3<<3);
assign p=s3;
endmodule