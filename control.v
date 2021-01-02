module control(in,z,Bgezal,MemRead,AluSrc,RegWrite,RegDest,JumpDest,WriteData,AluOp);
input [5:0] in;
input z;
output Bgezal,MemRead,AluSrc,RegWrite;
output [1:0] RegDest,JumpDest,WriteData;
output [2:0] AluOp;
wire bgezal,jmadd,balrz,ori,jpc,srlv;

assign bgezal=(in[5])&(~in[4])&(~in[3])&(~in[2])&(in[1])&(in[0]);   //bgezal    100011
assign jmadd=(in[5])&(~in[4])&(~in[3])&(~in[2])&(~in[1])&(~in[0]);  //jmadd     100000
assign balrz=(~in[5])&(in[4])&(~in[3])&(in[2])&(in[1])&(~in[0]);    //balrz     010110
assign ori=(~in[5])&(~in[4])&(in[3])&(in[2])&(~in[1])&(in[0]);      //ori       001101
assign jpc=(~in[5])&(in[4])&(in[3])&(in[2])&(in[1])&(~in[0]);       //jpc       011110
assign srlv=(~in[5])&(~in[4])&(~in[3])&(in[2])&(in[1])&(~in[0]);    //srlv      000110

assign RegDest[1]=bgezal|jmadd;
assign RegDest[0]=(balrz&z)|srlv;
assign AluOp[2]=balrz;
assign AluOp[1]=balrz|srlv;
assign AluOp[0]=bgezal|jmadd|balrz;
assign JumpDest[1]=(balrz&z)|jpc;
assign JumpDest[0]=jmadd|(balrz&z);
assign Bgezal=bgezal;
assign WriteData[1]=bgezal|jmadd|jpc;
assign WriteData[0]=bgezal|(balrz&z)|jpc;
assign MemRead=jmadd;
assign AluSrc=ori;
assign RegWrite=(~(balrz&~z));

endmodule