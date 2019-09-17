module planemover
    (input  wire clk,
     input  wire rst,
     input  wire move,
     input  wire left,
     input  wire right,
	  input  wire planehit,
     output wire [10:0] ox,
     output wire [10:0] oy);
   
   localparam S0 = 0, S1 = 1;
	
	reg [1:0] state,statenext;
	
	reg [10:0] planex, planexnext, planey, planeynext;
	
	
	always @(posedge clk) begin
		if(rst) begin
			state <= S0;
			planex <= 11'd496;
			planey <= 11'd650;
		end
		else begin
			state <= statenext;
			planex <= planexnext;
			planey <= planeynext;
		end
	end
	
	always @(*) begin
		statenext = state;
		planexnext = planex;
		planeynext = planey;
		
		case(state)
			S0: begin
				planexnext = 11'd496;
				planeynext = 11'd650;
				statenext = S1;
			end
			
			S1: begin
				if(move) begin
					if(right && planex < 992)
						planexnext = planex + 11'd2;
					else if(left && planex > 0) 
						planexnext = planex - 11'd2;
					if(planehit)
						planexnext = 11'd496;
				end
			end
			
			default:
				statenext = S0;
		endcase
	end
	
	assign ox = planex;
	assign oy = planey;

endmodule
