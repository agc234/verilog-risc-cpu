module sevensegtestbench();

	logic[3:0] num;
	logic a, b, c, d, e, f, g;
	
	sevenseg bob(num, a, b, c, d, e, f, g);
	
	initial begin
		num = 0; #10;
		num = 1; #10;
		num = 2; #10;
		num = 3; #10;
		num = 4; #10;
		num = 5; #10;
		num = 6; #10;
		num = 7; #10;
		num = 8; #10;
		num = 9; #10;
	end

endmodule
