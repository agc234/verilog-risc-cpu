module pctestbench();
	logic clk, rst;
	logic[2:0] instruction_A;
	logic RegWrite, MemWrite;
	logic[31:0] probe_register_file;
	logic[31:0] probe_data_memory;
	
	pc bob(clk, rst, instruction_A, RegWrite, MemWrite, probe_register_file, probe_data_memory);
	
	parameter PERIOD = 10;
	always begin
		 clk = 1'b1; 
		 #(PERIOD);

		 clk = 1'b0;
		 #(PERIOD);
	end
	
	initial begin
		rst = 0;
		#(50);
		rst = 1;
	end
	
	initial begin
		#(50);
		//instruction_A = 0; RegWrite = 0; MemWrite = 0; #80;
		instruction_A = 1; RegWrite = 1; MemWrite = 0; #80;
		instruction_A = 2; RegWrite = 0; MemWrite = 1; #80;
		instruction_A = 3; RegWrite = 1; MemWrite = 0; #80;
		instruction_A = 4; RegWrite = 1; MemWrite = 0; #80;
	end
endmodule
