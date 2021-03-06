`timescale 1ns / 1ps
 
module InstructionDecode(
        // inputs
        Clk, Rst, Instruction, WriteData, WriteRegister_IN,
        // outputs
        ReadData1, ReadData2, Immediate_Extended, Instruction_20_16, Instruction_15_11, Instruction_10_6,
        // control signals
        RegWrite, MemWrite, MemRead, MemtoReg, RegDst, ALUSrc, Branch, WrEn, RdEn, ZeroExtend, ALUOp, ReadDataSelect, mthi, mtlo, /////////Added RdEn
        //REGWRITE SIGNAL FROM WB STAGE
        RegWrite_WB
);

   // Inputs   
   input Clk, Rst;
   input RegWrite_WB; ////////////REGWRITE SIGNAL FROM WB STAGE
   input [31:0] Instruction;
   input [31:0] WriteData;
   input [4:0] WriteRegister_IN;
   
   // Outputs
   output [31:0] ReadData1, ReadData2, Immediate_Extended;
   output [5:0] ALUOp;
   output reg  [4:0] Instruction_20_16, Instruction_15_11, Instruction_10_6;
   
   // Control Signals
   output RegWrite, MemWrite, MemRead, MemtoReg, RegDst, Branch, WrEn, RdEn, ZeroExtend; /////////ADDED RdEn
   output [1:0] ALUSrc;
   output ReadDataSelect, mthi, mtlo;
   
   always @ (*) begin
    Instruction_20_16 <= Instruction[20:16];
    Instruction_15_11 <= Instruction[15:11];
    Instruction_10_6 <= Instruction[10:6];
   end
   
   RegisterFile regFile(
       .ReadRegister1(Instruction[25:21]), 
       .ReadRegister2(Instruction[20:16]), 
       .WriteRegister(WriteRegister_IN), 
       .WriteData(WriteData), 
       .RegWrite(RegWrite_WB),
       .Clk(Clk), 
       .ReadData1(ReadData1), 
       .ReadData2(ReadData2)
      );
      
  Control ctl(
        .Instruction(Instruction), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .RegDst(RegDst), 
        .ALUSrc(ALUSrc), 
        .Branch(Branch), 
        .ALUOp(ALUOp), 
        .WrEn(WrEn),
        .RdEn(RdEn), ////////////////////////////// 
        .ZeroExtend(ZeroExtend),
        .ReadDataSelect(ReadDataSelect),
        .mthi(mthi),
        .mtlo(mtlo)
       );
       
       SignExtension signExtend(
        .in(Instruction[15:0]), 
        .ZeroExtend(ZeroExtend), 
        .out(Immediate_Extended)
       );
   
endmodule