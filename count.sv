module count(input clk_in,output [6:0] d, output reg sel1, sel2);
	reg [7:0] in;
	reg [3:0] d1,d2;
	
	
	reg [3:0] num;
	reg clk1, clk2;
	segment7 disp1(num, d);
	
	
	clock clock1(clk_in,clk1,25_000_000);
	clock clock2(clk_in,clk2,25_000);
	initial begin 
		in = 0;
		sel1 = 1;
		sel2 = 0;
		
	end
	
	always@(posedge clk1)begin
		in =  in + 1;
		if(in > 99) in = 0;
		d1 = in % 10;
		d2 = in / 10;
	end
	
	
	always@(posedge clk2)begin		
		if(sel1)begin
			num = d1;
		end
		if(sel2) begin
			num = d2;
		end
		sel2=~sel2;
		sel1=~sel1;
			
	end
endmodule
