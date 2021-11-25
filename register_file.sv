module register_file 
#(parameter W = 32, parameter D = 32)
(input logic clk, rst,
 input logic [4:0] A1, A2, A3,
 input logic [D-1:0] WD3,
 input logic WE3,
 output logic [D-1:0] RD1, RD2, probe
);
	
	logic [W-1:0] registers[D-1:0];
	
	always @(posedge clk or negedge rst)
	begin
		if(!rst) begin
			for(int i = 0; i < D; i++) begin
				registers[i] <= i;
			end
		end
		else begin
			if (WE3 == 1) registers[A3] <= WD3;
		end
	end
	
	assign RD1 = registers[A1];
	assign RD2 = registers[A2];
	assign probe = registers[A3];
endmodule
