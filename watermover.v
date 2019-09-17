module watermover
    (input  wire clk,
     input  wire rst,
     input  wire move,
     input  wire  [10:0] inx,
     input  wire  [10:0] iny,
     output wire  [10:0] ox,
     output wire  [10:0] oy);
   
   localparam S0 = 0, S1 = 1;
	
	reg [1:0] state,statenext;
	
	reg signed [10:0] waterx, waterxnext, watery, waterynext;
	
	
	always @(posedge clk) begin
		if(rst) begin
			state <= S0;
			waterx <= inx;
			watery <= iny;
		end
		else begin
			state <= statenext;
			waterx <= waterxnext;
			watery <= waterynext;
		end
	end
	
	always @(*) begin
		statenext = state;
		waterxnext = waterx;
		waterynext = watery;
		
		case(state)
			S0: begin
				waterxnext = inx;
				waterynext = iny;
				statenext = S1;
			end
			
			S1: begin
				if(move) begin
					waterynext = watery + 11'd1;
                    if(watery > 11'd767)
                        waterynext = 11'd128;
				end
			end
			
			default:
				statenext = S0;
		endcase
	end
	
	assign ox = waterx;
	assign oy = watery;

endmodule