module plhit
    (
    input wire [10:0]  r1x,
    input wire [10:0]  r1y,
    input wire [10:0]  r2x,
    input wire [10:0]  r2y,
    input wire [10:0]  r3x,
    input wire [10:0]  r3y,
    input wire [10:0]  r4x,
    input wire [10:0]  r4y,
    input wire [10:0]  px,
    input wire [10:0]  py,
    output wire  planehit);
    
    assign planehit =   ((px + 11'd16 > r1x) && (px + 11'd16 < r1x + 11'd32) && (py > r1y) && (py < r1y + 11'd32)) ||
                        ((px + 11'd16 > r2x) && (px + 11'd16 < r2x + 11'd32) && (py > r2y) && (py < r2y + 11'd32)) ||
                        ((px + 11'd16 > r3x) && (px + 11'd16 < r3x + 11'd32) && (py > r3y) && (py < r3y + 11'd32)) ||
                        ((px + 11'd16 > r4x) && (px + 11'd16 < r4x + 11'd32) && (py > r4y) && (py < r4y + 11'd32));
	 
endmodule