module alutestbench();
	logic [32-1:0] SrcA, SrcB, ALUResult; 
	logic [2:0] ALUControl;
	alu #(32) bob(SrcA, SrcB, ALUControl, ALUResult);
	
	initial begin
		// test and/or
		SrcA = 10; SrcB = 5; ALUControl = 3'b000; #50; // A & B
		SrcA = 10; SrcB = 5; ALUControl = 3'b001; #50; // A | B
		SrcA = 10; SrcB = 5; ALUControl = 3'b100; #50; // A & -B
		SrcA = 10; SrcB = 5; ALUControl = 3'b101; #50; // A | -B
		
		// test add/sub
		SrcA = 10; SrcB = 5;  ALUControl = 3'b010; #50; // 10 + 5 = 15
		SrcA = 10; SrcB = 5;  ALUControl = 3'b110; #50; // 10 - 5 = 5
		SrcA = 5;  SrcB = 10; ALUControl = 3'b010; #50; // 5 + 10 = 15
		SrcA = 5;  SrcB = 10; ALUControl = 3'b110; #50; // 10 - 5 = 5
		SrcA = -5; SrcB = -5; ALUControl = 3'b010; #50; // (-5) + (-5) = -10
		SrcA = -5; SrcB = -5; ALUControl = 3'b110; #50; // (-5) - (-5) = 0

		
		// test default case
		SrcA = 10; SrcB = 5; ALUControl = 3'b011; #50; // out = 0

	end
endmodule
