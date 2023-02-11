//Clock module with period 10
module CLK(Out);
    output reg Out;
    initial Out=0;
    always #10 Out=~Out;
endmodule

//Testbench
module Testbench();
    wire clk,Q0,Q1,Q2;
    reg rst;
    wire [2:0] out;
    CLK clock(clk);
    MOD8Counter DUT(out,rst,clk);
    //to show individual bit of output in vcd waveform output
    assign Q0=out[0];
    assign Q1=out[1];
    assign Q2=out[2];
    //no. of numbers counted
    integer cntr;
    initial 
    begin
        //reseting the counter
        $dumpfile("dump.vcd"); 
        $dumpvars(1);
        rst=1;
        #5 rst=0; 
        cntr=0;
    end
    always @ (posedge clk)
    begin
        //finish after printing 20 numbers
      if(cntr>20)$finish;
        cntr<=cntr+1;
      $display($time,": Output: %b",out);
    end
endmodule