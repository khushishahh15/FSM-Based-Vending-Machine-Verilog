module vending_machine(
    input clk,
    input rst,
    input [1:0] in,          //00=No Coin, 01=Rs5, 10=Rs10
    output reg out,
    output reg [3:0] change
);
parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
reg [1:0] c_state, n_state;

always @(posedge clk)
begin
    if(rst)
    begin
        c_state <= s0;
        n_state <= s0;
        out <= 0;
        change <= 0;
    end

    else
    begin

        c_state <= n_state;

        case(c_state)

        //S0
        s0:
        begin
            if(in == 2'b00)
            begin
                n_state <= s0;
                out <= 0;
                change <= 0;
            end
          
            else if(in == 2'b01)
            begin
                n_state <= s1;
                out <= 0;
                change <= 0;
            end
          
            else if(in == 2'b10)
            begin
                n_state <= s2;
                out <= 0;
                change <= 0;
            end
        end

        //S1
        s1:
        begin
            if(in == 2'b00)
            begin
                n_state <= s0;
                out <= 0;
                change <= 5;
            end

            else if(in == 2'b01)
            begin
                n_state <= s2;
                out <= 0;
                change <= 0;
            end

            else if(in == 2'b10)
            begin
                n_state <= s0;
                out <= 1;
                change <= 0;
            end
        end

        //S2 
        s2:
        begin
            if(in == 2'b00)
            begin
                n_state <= s0;
                out <= 0;
                change <= 10;
            end

            else if(in == 2'b01)
            begin
                n_state <= s0;
                out <= 1;
                change <= 0;
            end

            else if(in == 2'b10)
            begin
                n_state <= s0;
                out <= 1;
                change <= 5;
            end
        end

        default:
        begin
            n_state <= s0;
            out <= 0;
            change <= 0;
        end
        endcase
    end
end

endmodule
