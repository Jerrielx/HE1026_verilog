module simple_fsm(input up, input clock, input reset, output reg [1:0] state);
    always @(posedge clock) begin
        if(!reset) state <= 0;
        else begin
            case(state)
                0: if(up) state <= 1;
                else state <= 3;
                1: if(up) state <= 2;
                else state <= 0;
                2: if(up) state <= 3;
                else state <= 1;
                3: if(up) state <= 0;
                else state <= 2;
            endcase
        end
    end
endmodule