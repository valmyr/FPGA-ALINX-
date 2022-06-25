module sequencia_de_fibonacci(input clk_in,output [6:0] d, output reg [5:0] sel);
	reg [31:0] in,n1,n2,t;
	reg [3:0] d1,d2,d3,d4,d5,d6, num;
	reg clk1, clk2;
	segment7 disp1(num, d);
	
	
	clock clock1(clk_in,clk1,50_000_000);
	clock clock2(clk_in,clk2,1_000);
	initial begin 
		sel = 6'b111111;
		d1 = 0;
		d2 = 0;
		d3 = 0;
		d4 = 0;
		d5 = 0;
		d6 = 0;
		n1 = 1;
		n2 = 1;
	end
	
	always@(posedge clk1)begin
		in = n1;
		t = n1 + n2;
		n1 = n2;
		n2 = t;
		if(in > 999999) begin 
			n1 = 1;
			n2 = 1;
		end
		d1 = (in / 1)%10;
		d2 = (in / 10)%10;
		d3 = (in / 100)%10;
		d4 = (in / 1000)%10;
		d5 = (in / 10000)%10;
		d6 = (in / 100000)%10;
	end
	
	
	always@(posedge clk2)begin
		case(sel)
			6'b111111: num = d1;
			6'b111110: num = d2;
			6'b111101: num = d3;
			6'b111011: num = d4;
			6'b110111: num = d5;
			6'b101111: num = d6;
		endcase
		
		if(sel == 6'b111111)
			sel = 6'b111110;
		else
			sel = ~(~sel<<1);
	end
endmodule
