module clock(input clk_in, output reg clk,input reg[31:0] ct);
	reg [31:0] t = 0;
	initial begin
		clk = 0;
	end
	
	always@(posedge clk_in)begin
		t = t + 1;
		if(t  == ct)begin
			t = 0;
			clk = ~clk;
		end
	end

endmodule
