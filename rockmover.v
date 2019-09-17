module rockmover
    (input  wire clk,
     input  wire rst,
     input  wire move,
     input  wire collision,
	  input wire planehit,
     input wire [10:0]  inx,
     input wire [10:0]  iny,
     output wire [10:0] ox,
     output wire [10:0] oy);
   
   localparam S0 = 0, S1 = 1, S2 = 2;
	
	reg [1:0] state,statenext;
	
	reg [10:0] rockx, rockxnext, rocky, rockynext;
	
	
	always @(posedge clk) begin
		if(rst) begin
			state <= S0;
			rockx <= inx;
			rocky <= iny;
		end
		else begin
			state <= statenext;
			rockx <= rockxnext;
			rocky <= rockynext;
		end
	end
	
	always @(*) begin
		statenext = state;
		rockxnext = rockx;
		rockynext = rocky;
		
		case(state)
			S0: begin
                rockxnext = inx;
                rockynext = iny;
                statenext = S2;
			end
			
			S1: begin
				rockynext = (rocky - 11'd760) % 11'd128;
				rockxnext = ((rockx + 248) % 11'd512) + 11'd333;
				statenext = S2;
			end
            
         S2: begin
				if(move) begin
					rockynext = rocky + 11'd2;
						if(collision || rocky > 11'd770 || planehit)
							statenext = S1;
				end
			end
			
			default:
				statenext = S0;
		endcase
	end
	
	assign ox = rockx;
	assign oy = rocky;

endmodule