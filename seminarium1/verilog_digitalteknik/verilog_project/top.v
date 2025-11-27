// datorlaboration 1
// FPGA

module and_gate(input a, input b, output y);
    assign y = a & b;
endmodule

// module top(input GP3, input GP4, output GP7);
//     and_gate a(GP3, GP4, GP7);
// endmodule

module top(input GP3, input GP4, input GP5, input GP6, output GP7, output GP8, output GP9);
    wire clock;
    clock_100hz c(clock);
    jepardy_fsm jepardy_game({GP3, GP4, GP5}, GP6, clock, {GP7, GP8, GP9});
endmodule

module jepardy_fsm(input [2:0] P_button, input reset, input clock, output reg[2:0] lights);
    parameter Ready = 2'b00, Person1 = 2'b01, Person2 = 2'b10, Person3 = 2'b11;
    reg[1:0] state;
    always @(state) begin
        case(state)
            Ready: lights <= 3'b000;
            Person1: lights <= 3'b001;
            Person2: lights <= 3'b010;
            Person3: lights <= 3'b100;
            default: lights <= 3'b000;
        endcase
    end

    always @(posedge clock) begin
        if(reset) state <= Ready;
        else begin
            case (state)
                Ready: begin
                    if(P_button[0]) state <= Person1;
                    else if(P_button[1]) state <= Person2;
                    else if(P_button[2]) state <= Person3;
                end
            endcase
        end
    end
endmodule
