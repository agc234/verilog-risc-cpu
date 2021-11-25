module alu #(parameter N=32)
			  (input logic [N-1:0] SrcA, SrcB, 
			   input logic [2:0] ALUControl,
				output logic [N-1:0] ALUResult);
	
	logic [N-1:0] bb, s, ze, and2, or2;
	mux2 #(N) negator(SrcB, ALUControl[2], bb);
	adder #(N) addsub(SrcA, bb, s);
	assign and2 = SrcA & bb;
	assign or2 = SrcA | bb;
	mux4 #(N) selector(and2, or2, s, ALUControl[1:0], ALUResult);
endmodule

module adder #(parameter N=8)
				  (input logic [N-1:0] a, b,
					output logic [N-1:0] s);
					
		assign s = a + b;
endmodule

module mux2 #(parameter N=8)
				 (input logic [N-1:0] in,
				  input logic F2,
				  output logic [N-1:0] out);
				  
	assign out = F2 ? -in : in;
endmodule

module mux4 #(parameter N=8)
				 (input logic [N-1:0] a, b, c,
				  input logic [1:0] F,
				  output logic [N-1:0] out);
	
	always_comb
		case(F)
			2'd0: out = a;
			2'd1: out = b;
			2'd2: out = c;
			default: out = 0;
		endcase
endmodule
