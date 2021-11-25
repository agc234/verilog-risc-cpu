module pc(
	input logic clk, rst,
	input logic[2:0] instruction_A,
	input logic RegWrite, MemWrite,
	output logic[31:0] probe_register_file,
	output logic[31:0] probe_data_memory,
	output logic a1, b1, c1, d1, e1, f1, g1,
	output logic a2, b2, c2, d2, e2, f2, g2
);
// op = instr[31:26]
// RegDst = instr[31]
// ALUSrc = instr[30]
// ALUControl = instr[29:27]
// MemtoReg = instr[26]


// DATAPATH
	logic[31:0] instr, WriteData, SrcA, SrcB, SignImm, ALUResult, ReadData, Result;
	logic[4:0] WriteReg;
	instruction_memory jerry(clk, rst, instruction_A, instr); // instr=RD
	// Mux_RegDst
	assign WriteReg = (instr[31]) ? (instr[15:11]) : (instr[20:16]); // WriteReg=A3
	sign_extend jim(instr[15:0], SignImm);
	register_file jeremy(clk, rst, 
								instr[25:21],instr[20:16], WriteReg, 
								Result, 
								RegWrite, 
								SrcA, WriteData, probe_register_file);
	// Mux_ALUSrc
	assign SrcB = (instr[30]) ? SignImm : WriteData;
	alu jeff(SrcA, SrcB, instr[29:27], ALUResult);
	data_memory john(clk, rst, ALUResult, WriteData, MemWrite, ReadData, probe_data_memory);
	MUX_MemtoReg jackson(instr[26], ALUResult, ReadData, Result);
	
	sevenseg registersevenseg(probe_register_file[3:0], a1, b1, c1, d1, e1, f1, g1);
	sevenseg datasevenseg(probe_data_memory[3:0], a2, b2, c2, d2, e2, f2, g2);
	
endmodule
