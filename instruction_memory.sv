module instruction_memory
#(parameter W = 32, 
  parameter D = 32)
(input logic clk, rst,
 input logic[2:0] A,
 output logic[31:0] RD
);

reg[W-1:0] ins_regs[D-1:0];

always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		ins_regs[0] <= 32'b0;
		ins_regs[1] <= 32'b010101_00010_00001_0000000000000011; // ld, rs = 2, rt = 1, imm = 3
		ins_regs[2] <= 32'b010100_01000_00001_0000000000000001; // sw, rs = 8, rt = 1, imm = 1
		ins_regs[3] <= 32'b100100_00011_00100_00001_00000000000; // add, rs = 3, rt = 4, rd = 1
		ins_regs[4] <= 32'b101100_01010_01000_00001_00000000000; // sub, rs = 10, rt = 8, rd = 1
		//ins_regs[5] <= 32'b010101_00000_00001_N; // ld, rs = 0, rt = 1, imm = N
	end
	else begin
		RD <= ins_regs[A];
	end
end

endmodule
