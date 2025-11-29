module simple_dff(input d, input clock, output reg q);
    always @(posedge clock) begin
        q <= d;
    end
endmodule


module shift_8b(input d, input clock, output [7:0] q);
    wire [7:0] next;
    assign q = next;
    simple_dff dff0( d, clock, next[0]);
    simple_dff dff1(next[0], clock, next[1]);
    simple_dff dff2(next[1], clock, next[2]);
    simple_dff dff3(next[2], clock, next[3]);
    simple_dff dff4(next[3], clock, next[4]);
    simple_dff dff5(next[4], clock, next[5]);
    simple_dff dff6(next[5], clock, next[6]);
    simple_dff dff7(next[6], clock, next[7]);
endmodule