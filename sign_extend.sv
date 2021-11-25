module sign_extend(
	input logic[15:0] Imm,
	output logic[31:0] SignImm
);

assign SignImm = {{16{Imm[15]}},Imm};
endmodule
