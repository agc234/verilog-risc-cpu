module sevenseg(
	input logic[3:0] num,
	output logic a, b, c, d, e, f, g
);

	// a=0, b=1, c=2, d=3, e=4, f=5, g=6;
	logic[6:0] mid;

	always_comb
		case(num)
			4'd0: mid=7'b0000001;
			4'd1: mid=7'b1001111;
			4'd2: mid=7'b0010010;
			4'd3: mid=7'b1111001;
			4'd4: mid=7'b1001100;
			4'd5: mid=7'b0100100;
			4'd6: mid=7'b0100000;
			4'd7: mid=7'b0001111;
			4'd8: mid=7'b0000000;
			4'd9: mid=7'b0001100;
			default: mid=7'b1111110;
		endcase

	assign {a,b,c,d,e,f,g} = mid;
endmodule
