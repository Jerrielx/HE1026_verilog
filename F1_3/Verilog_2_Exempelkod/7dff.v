module simple_dff(input d, input clock, output reg q);
    always @(posedge clock) begin
        q <= d;
    end
endmodule