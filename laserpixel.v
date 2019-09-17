module lazerpixel
    (input wire clk,
    input wire rst,
    input wire [10:0]  ox,
    input wire [10:0]  oy,
    input wire [10:0]  px,
    input wire [10:0]  py,
    output wire        lazer_color);

   wire 	             inobj;
   wire [2:0]  		 lazer_y, lazer_x;
	
   reg [7:0] 	       rom_data;
   wire [2:0] 	       rom_addr;
   wire               rom_bit;
	
   
   assign inobj     = (px >= ox) && (px < ox + 11'd8) && (py >=  oy) && (py < oy + 11'd8);
   
   assign lazer_x     = inobj ? px - ox : 0;
   assign lazer_y     = inobj ? py - oy : 0;
   
   assign rom_addr   = lazer_y;
   assign rom_bit    = rom_data[lazer_x];
   
   assign lazer_color = (rom_bit) ? 1'b1 : 1'b0;

   always @*
     case (rom_addr)
       3'd0: rom_data = 8'b00111100; 
       3'd1: rom_data = 8'b00111100; 
       3'd2: rom_data = 8'b00111100; 
       3'd3: rom_data = 8'b00111100; 
       3'd4: rom_data = 8'b00111100; 
       3'd5: rom_data = 8'b00111100; 
       3'd6: rom_data = 8'b00111100; 
       3'd7: rom_data = 8'b00111100;  
     endcase
     
endmodule 