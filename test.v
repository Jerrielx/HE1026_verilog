// räknare
module counter(input clock, input reset, input up_down, output [7:0] value);
    reg [7:0] count;
    assign value = count;
    always @(posedge clock) begin
        if(reset) count <= 0;
        else if(up_down == 1'b1) count = count + 1;
        else count <= count - 1;
    end
endmodule