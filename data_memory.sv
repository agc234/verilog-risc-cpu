module data_memory
#(parameter W = 32,
  parameter D = 32)
(input logic clk, rst,
 input logic[D-1:0] A,
 input logic[D-1:0] WD,
 input logic WE,
 output logic[D-1:0] RD,
 output logic[D-1:0] probe
);

reg[W-1:0] registers[D-1:0];

always@(posedge clk or negedge rst)
begin
	if(!rst) begin
		for(int i = 0; i < D; i++) begin
			registers[i] <= i;
		end
	end
	else begin
		if(WE == 1) registers[A] <= WD;
	end
end

assign RD = registers[A];
assign probe = registers[A];
endmodule
