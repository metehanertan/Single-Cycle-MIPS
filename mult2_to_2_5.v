module mult2_to_2_5(out, i0,i1,i2,i3,s0);
input [4:0]i0,i1,i2,i3;
input [1:0]s0;
output [4:0] out;

always @(i0 or i1 or i2 or i3 or s0)
begin
	case(s0)
	2'b00: out=i0;		//ALU control line=000, OR
	2'b01: out=i1; 		//ALU control line=001, ADD
	2'b10: out=i2;
	2'b11: out=i3

end

endmodule
