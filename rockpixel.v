module rockpixel
    (input wire clk,
    input wire rst,
    input wire [10:0]  ox,
    input wire [10:0]  oy,
    input wire [10:0]  px,
    input wire [10:0]  py,
    output wire [1:0]  rock_color);

   wire 	             inobj;
   wire [4:0]  		 rock_y, rock_x;
	
   reg [31:0] 	       rom_data_brown, rom_data_orange;
   wire [4:0] 	       rom_addr;
   wire               rom_bit_brown, rom_bit_orange;
	
   
   assign inobj      = (px >= ox) && (px < ox + 11'd32) && (py >=  oy) && (py < oy + 11'd32);
   
   assign rock_x     = inobj ? px - ox : 0;
   assign rock_y     = inobj ? py - oy : 0;
   
   assign rom_addr   = rock_y;
   assign rom_bit_brown    = rom_data_brown[rock_x];
   assign rom_bit_orange    = rom_data_orange[rock_x];
   
   assign rock_color = (rom_bit_brown) ? 2'd1 : 
                       (rom_bit_orange) ? 2'd2 : 2'd0;
                        

   always @*
     case (rom_addr)
       5'h00: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h01: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h02: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h03: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h04: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h05: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h06: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h07: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h08: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h09: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h0a: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h0b: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h0c: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h0d: rom_data_brown = 32'b00000000000001111110000000000000; 
       5'h0e: rom_data_brown = 32'b00000000000111111111100000000000; 
       5'h0f: rom_data_brown = 32'b00000000001111111111110000000000; 
       5'h10: rom_data_brown = 32'b00000000011111111111111000000000; 
       5'h11: rom_data_brown = 32'b00000000011111111111111000000000; 
       5'h12: rom_data_brown = 32'b00000000111111111111111100000000; 
       5'h13: rom_data_brown = 32'b00000000111111111111111100000000;
       5'h14: rom_data_brown = 32'b00000000111111111111111100000000;
       5'h15: rom_data_brown = 32'b00000000111111111111111100000000;
       5'h16: rom_data_brown = 32'b00000000111111111111111100000000;
       5'h17: rom_data_brown = 32'b00000000011111111111111000000000; 
       5'h18: rom_data_brown = 32'b00000000011111111111111000000000; 
       5'h19: rom_data_brown = 32'b00000000001111111111110000000000; 
       5'h1a: rom_data_brown = 32'b00000000000111111111100000000000; 
       5'h1b: rom_data_brown = 32'b00000000000001111110000000000000; 
       5'h1c: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h1d: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h1e: rom_data_brown = 32'b00000000000000000000000000000000; 
       5'h1f: rom_data_brown = 32'b00000000000000000000000000000000; 
     endcase
     
   always @*
     case (rom_addr)
       5'h00: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h01: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h02: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h03: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h04: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h05: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h06: rom_data_orange = 32'b00000000000000100000000000000000; 
       5'h07: rom_data_orange = 32'b00000000000000110000000000000000; 
       5'h08: rom_data_orange = 32'b00000000000000111000000000000000; 
       5'h09: rom_data_orange = 32'b00000000000001111100000000000000; 
       5'h0a: rom_data_orange = 32'b00000000000011111110000000000000; 
       5'h0b: rom_data_orange = 32'b00000000000111111111000000000000; 
       5'h0c: rom_data_orange = 32'b00000000001111111111100000000000; 
       5'h0d: rom_data_orange = 32'b00000000001110000001111000000000; 
       5'h0e: rom_data_orange = 32'b00000000111000000000011000000000; 
       5'h0f: rom_data_orange = 32'b00000001110000000000001100000000; 
       5'h10: rom_data_orange = 32'b00000001100000000000000110000000; 
       5'h11: rom_data_orange = 32'b00000001100000000000000111000000; 
       5'h12: rom_data_orange = 32'b00000001000000000000000011000000; 
       5'h13: rom_data_orange = 32'b00000001000000000000000011000000;
       5'h14: rom_data_orange = 32'b00000001000000000000000011000000;
       5'h15: rom_data_orange = 32'b00000001000000000000000011000000;
       5'h16: rom_data_orange = 32'b00000001000000000000000011000000;
       5'h17: rom_data_orange = 32'b00000001100000000000000111000000; 
       5'h18: rom_data_orange = 32'b00000001100000000000000110000000; 
       5'h19: rom_data_orange = 32'b00000001110000000000001100000000; 
       5'h1a: rom_data_orange = 32'b00000000111000000000011000000000; 
       5'h1b: rom_data_orange = 32'b00000000011110000001110000000000; 
       5'h1c: rom_data_orange = 32'b00000000000111111111000000000000; 
       5'h1d: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h1e: rom_data_orange = 32'b00000000000000000000000000000000; 
       5'h1f: rom_data_orange = 32'b00000000000000000000000000000000; 
     endcase
     
endmodule 