// Program  : TIDAA
// Course   : HE1026 Digital teknik
// Author   : Jerry Cheung
// Date     : 2025-11-29
// File     : top.v
// Description: verilog coding on FPGA 
//              sequential circuit from lab2 trafic signals


module top(input GP1, input GP2, , input GP3, output GP4, output GP5, output GP6);
    // wire clock;
    // clock_100hz c(clock);
    traffic_light_fsm traffic_signal(
         GP1    // reset(NCLR)
        ,GP2    // x
        ,GP3    // clock
        ,GP4    // red
        ,GP5    // yellow
        ,GP6    // green
    );
endmodule


module traffic_light_fsm(input reset, input x, input clock,
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
            default: begin
                r = 1'b0;
                y = 1'b0;
                g = 1'b1;
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
                default:
                    state <= green;
            endcase
        end
    end
endmodule