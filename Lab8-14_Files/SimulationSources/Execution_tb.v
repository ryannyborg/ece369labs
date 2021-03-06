`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Description - Test the sign extension module.
////////////////////////////////////////////////////////////////////////////////

module Execution_tb();

   reg Clk, Rst;   // control bits for ALU operation
   reg [4:0] Instruction_20_16, Instruction_15_11;
   reg [31:0] ReadData1, ReadData2, Immediate_Extended;
   reg [5:0] ALUOp;
   reg RegWrite, MemWrite, MemRead, MemtoReg, RegDst, ALUSrc, Branch, WrEn, ZeroExtend;
   
   wire [31:0] ReadData2_Out, LoResult;
   wire [4:0] RegDestAddress;
   wire MemRead_Out, MemWrite_Out, MemtoReg_Out, RegWrite_Out, Zero;
    
    Execution executionTest(
    .Clk(Clk), .Rst(Rst), .Instruction_20_16(Instruction_20_16), .Instruction_15_11(Instruction_15_11),
	.ReadData1(ReadData1), .ReadData2(ReadData2), .Immediate_Extended(Immediate_Extended), .ALUOp(ALUOp),
	.RegWrite(RegWrite), .MemWrite(MemWrite), .MemRead(MemRead), .MemtoReg(MemtoReg), .RegDst(RegDst), .ALUSrc(ALUSrc), 
	.Branch(Branch), .WrEn(WrEn), .ZeroExtend(ZeroExtend), .ReadData2_Out(ReadData2_Out),
	.RegDestAddress(RegDestAddress), .MemRead_Out(MemRead_Out), .MemWrite_Out(MemWrite_Out), .MemtoReg_Out(MemtoReg_Out),
	.RegWrite_Out(RegWrite_Out), .Zero(Zero), .ALULoResult(LoResult)
    );

   initial begin
        Clk <= 1'b0;       
        Rst <= 0;
        Instruction_20_16 <= 5'b10000;
        Instruction_15_11 <= 5'b00000;
        ReadData1 <= 0;
        ReadData2 <= 0;
        Immediate_Extended <= 1;
        ALUOp <= 6'b000001; // add
        RegWrite <= 1;
        MemWrite <= 0;
        MemRead <= 0;
        MemtoReg <= 0;
        RegDst <= 0;
        ALUSrc <= 1;
        Branch <= 0;
        WrEn <= 0;
        #100;       
        
        forever #100 Clk <= ~Clk;
        
    end
    
    

endmodule