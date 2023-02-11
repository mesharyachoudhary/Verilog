module Testbench();
    wire clk, done;
    wire [63:0] sum;
    reg [31:0] Nn;
    Clock Clk(clk);
    reg Gg;
  ASM DUT(sum, done, Nn, Gg, clk);
    initial
    begin
        Nn <= 50;
        #10 Gg <=1;
        #20 Gg <=0;
    end
    always @ (posedge clk)
    begin
        if(done)
        begin
          $display($time," : The sum of required numbers upto %d is %d",Nn,sum);
            $finish;
        end
    end
endmodule