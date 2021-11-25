module rftestbench();
	logic clk, rst;
	logic [4:0] A1, A2, A3;
	logic [31:0] WD3;
	logic WE3;
	logic [31:0] RD1;
	logic [31:0] RD2;
	
	register_file timmy(clk, rst, A1, A2, A3, WD3, WE3, RD1, RD2);
	
	parameter PERIOD = 5;
	always begin
		 clk = 1'b1; 
		 #(PERIOD); // high for 20 * timescale = 20 ns

		 clk = 1'b0;
		 #(PERIOD); // low for 20 * timescale = 20 ns
	end
	
	initial begin
		rst = 0;
		#(60);
		rst = 1;
	end

	
	initial begin
		A1 = 0; A2 = 0; A3 = 0; WD3 = 0; WE3 = 0; #60;
		A1 = 1; A2 = 2; A3 = 0; WD3 = 0; WE3 = 0; #40;
		A1 = 2; A2 = 1; A3 = 0; WD3 = 0; WE3 = 0; #40;
		A1 = 5; A2 = 0; A3 = 5; WD3 = 56; WE3 = 0; #40;
		A1 = 5; A2 = 0; A3 = 5; WD3 = 56; WE3 = 1; #40;
		A1 = 5; A2 = 4; A3 = 4; WD3 = 26; WE3 = 0; #40;
		A1 = 5; A2 = 4; A3 = 4; WD3 = 26; WE3 = 1; #40;
	end
endmodule
