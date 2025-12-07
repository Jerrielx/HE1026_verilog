// Program  : TIDAA
// Course   : HE1026 Digital teknik
// Author   : Jerry Cheung
// Date     : 2025-12-04
// File     : top.v
// Description: lab3 uppgift C 
//              sequential circuit 
//              GP3-5   input   NCLR, X, CLOCK
//              GP6-8   output  red, yellow, green


module top(input GP3, input GP4, input GP5, output GP6, output GP7, output GP8);
    // wire clock;
    // clock_100hz c(clock);
    uppgift_c_fsm fsm(
         GP3    // reset(NCLR)
        ,GP4    // x
        ,GP5    // clock
        ,GP6    // red
        ,GP7    // yellow
        ,GP8    // green
    );
endmodule


module uppgift_c_fsm(input reset, input x, input clock,
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
        if(!reset) begin
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