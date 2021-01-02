module mult2_to_2_32(out, i0,i1,i2,i3,s0);
input [31:0]i0,i1,i2,i3;
input [1:0]s0;
output [31:0]out;
always @*
if ((~s0[1])&(~s0[0]))out=i0; //00
if ((~s0[1])&(s0[0]))out=i1;  //01
if ((s0[1])&(~s0[0]))out=i2;  //10
if ((s0[1])&(s0[0]))out=i3;  //11
end
endmodule
