module simple_fsm(input up, input clock, input reset, output [7:0] lights);
    parameter zero = 0, one = 1, two = 2, three = 3;
    reg [1:0] state;

    always @(state) begin
        case(state)
            zero:  lights = 8'b11111000;
            one:   lights = 8'b11100011;
            two:   lights = 8'b10001111;
            three: lights = 8'b00111110;
        endcase
    end

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