module colcheck
    (
    input wire [10:0]  lx,
    input wire [10:0]  ly,
    input wire [10:0]  rx,
    input wire [10:0]  ry,
    output wire  collision);
    
    assign collision = ((lx + 11'd4) > rx) && ((lx + 11'd4) < rx + 11'd32) && ((ly + 11'd4) > ry) && ((ly + 11'd4) < ry + 11'd32);
	 
endmodule