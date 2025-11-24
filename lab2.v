
// D-flip-flop
module traffic_light_fsm(input x, input clock, input reset,
            output reg r, output reg y, output reg g);
    
    parameter green = 0, tored = 1, red = 3, fred = 2;
    reg [1:0] state;
    always @(state) begin
        case(state)
            green: begin
                r = 1'b0;
                y = 1'b0;
                g = 1'b1;
            end
            tored: begin
                r = 1'b0;
                y = 1'b1;
                g = 1'b0;
            end
            red: begin
                r = 1'b1;
                y = 1'b0;
                g = 1'b0;
            end
            fred: begin
                r = 1'b1;
                y = 1'b1;
                g = 1'b0;
            end
        endcase
    end
    always @(posedge clock) begin   // posedge = rising edge    negedge = falling edge
        if(reset) begin
            state <= green;
        end else begin
            case(state)
                green:
                    if(x) state <= tored;
                tored: 
                    state <= red;
                red:
                    state <= fred;
                fred:
                    state <= green;
            endcase
        end
    end
endmodule