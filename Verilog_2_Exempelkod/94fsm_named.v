module simple_fsm(input up, input clock, input reset, output reg [1:0] state);
    parameter zero = 0, one = 1, two = 2, three = 3;
    always @(posedge clock) begin
        if(!reset) state <= 0;
        else begin
            case(state)
                zero:   if(up) state <= one;
                        else   state <= three;
                one:    if(up) state <= two;
                        else   state <= zero;
                two:    if(up) state <= three;
                        else   state <= one;
                three:  if(up) state <= zero;
                        else   state <= two;
            endcase
        end
    end
endmodule