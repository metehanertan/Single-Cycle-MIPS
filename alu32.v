module alu32(sum,a,b,gin,zFlag,nFlag);//ALU operation according to the ALU control line values
output [31:0] sum;
input [31:0] a,b; 
input [2:0] gin;//ALU control line
reg [31:0] sum;
output zFlag,nFlag;
integer i;

output zout;
reg zout;
always @(a or b or gin)
begin
	case(gin)
	3'b000: sum=a|b;		//ALU control line=000, OR
	3'b001: sum=a+b; 		//ALU control line=001, ADD
	3'b010: sum=a;
			for( i=b; i > 0; i=i-1 )
   				sum=sum << 1;

	zout=~(|sum);
end
endmodule
