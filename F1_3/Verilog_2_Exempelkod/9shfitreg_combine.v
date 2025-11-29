module shift_8b(input d, input clock, output reg [7:0] q);
    always @(posedge clock) begin
        q <= {q[6:0],d};
    end
endmodule