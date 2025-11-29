module garagedoor(input reset,input clock,
                  input open, input close, 
                  input door_up, input door_down, 
                  output reg power_up, output reg power_down);

    parameter state_open = 0, state_closed = 1, state_opening = 2, state_closing = 3;

    reg [1:0] state;  

    always @(state) begin
        case(state)
            state_open: begin
                power_up = 1'b0;
                power_down = 1'b0;
            end
            state_closed: begin
                power_up = 1'b0;
                power_down = 1'b0;
            end
            state_opening: begin
                power_up = 1'b1;
                power_down = 1'b0;
            end
            state_closing: begin
                power_up = 1'b0;
                power_down = 1'b1;
            end
        endcase
    end

    always @(posedge clock) begin
        if(reset) begin
            state <= state_open;
        end else begin
            case(state)
                state_open:   if(close) state <= state_closing;
                state_closed: if(open) state <= state_opening;
                state_opening: begin
                    if(close) state <= state_closing;
                    else if(door_up) state <= state_open;
                end
                state_closing: begin
                    if(open) state <= state_opening;
                    else if(door_down) state <= state_closed;
                end
            endcase
        end
    end

endmodule




module door_simulator(input clock, input reset, 
                      input power_up, input power_down, 
                      output reg open, output reg closed);
    reg [6:0] position;

    always @(position) begin
        case(position)
            0: begin 
                open = 1'b0;
                closed = 1'b1;
            end
            100: begin 
                closed = 1'b0;
                open = 1'b1;
            end
            default: begin
                open = 1'b0;
                closed = 1'b0;
            end
        endcase
    end


    always @(posedge clock) begin
        if(reset) position = 50;
        if(power_up && (position != 100)) begin
            position <= position + 1;
        end
        else if(power_down && (position != 0)) begin
            position <= position - 1;
        end
    end

endmodule


module tb(input open, close, clock, reset, output power_up, power_down);
    wire opened, closed;
    garagedoor gd(reset, clock, open, close, opened, closed, power_up, power_down);
    door_simulator ds(clock, reset, power_up, power_down, opened, closed);
endmodule