module lazermover
    (input  wire clk,
     input  wire rst,
     input  wire move,
     input  wire fire,
     input  wire collision,
     input wire [10:0]  inx,
     input wire [10:0]  iny,
     output wire [10:0] ox,
     output wire [10:0] oy);
   
   localparam S0 = 0, S1 = 1;
	
	reg [1:0] state,statenext;
	
	reg [10:0] lazerx, lazerxnext, lazery, lazerynext;
	
	
	always @(posedge clk) begin
		if(rst) begin
			state <= S0;
			lazerx <= 11'd1050;
			lazery <= 11'd128;
		end
		else begin
			state <= statenext;
			lazerx <= lazerxnext;
			lazery <= lazerynext;
		end
	end
	
	always @(*) begin
		statenext = state;
		lazerxnext = lazerx;
		lazerynext = lazery;
		
		case(state)
			S0: begin
                lazerxnext = 11'd1050;
                lazerynext = 11'd128;
                if(fire) begin
                    lazerxnext = inx;
                    lazerynext = iny;
                    statenext = S1;
                end
			end
			
			S1: begin
				if(move) begin
                    lazerynext = lazery - 11'd8;
                    if(collision || lazery < 11'd247)
                        statenext = S0;
				end
			end
			
			default:
				statenext = S0;
		endcase
	end
	
	assign ox = lazerx;
	assign oy = lazery;

endmodule