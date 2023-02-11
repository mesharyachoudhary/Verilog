//32-bit comparator
module Comparator(greaterthan, equalto, lessthan, X, Y);
  input wire [31:0] X,Y;
  output wire greaterthan, equalto, lessthan;
  assign greaterthan = (X>Y);
  assign equalto = (X==Y);
  assign lessthan = (X<Y);
endmodule

//Clock module with period 10
module Clock(out);
    output reg out;
    initial out=0;
    always #5 out=~out;
endmodule

//32-bit counter
module Counter(out, count, clr, clk);
    input count, clr, clk;
    output reg [31:0] out;
    initial out = 0;
    always @ (posedge clk)
    begin
        if(clr) out <= 0;
        else if(count) out <= out + 1;
    end
endmodule

//64-bit fulladder
module FullAdder(sum,X,Y);
  input wire [63:0] X,Y;
  output wire [63:0] sum;
  assign sum = X + Y;
endmodule

module Datapath(X,Y,countY, clearY, loadX, clearX, clk);
  input wire countY, clearY, loadX, clearX, clk;
  output wire [31:0] Y;
  output reg [63:0] X;
  wire [63:0] sum;
  wire [31:0] ground;
  assign ground = 0;
  FullAdder FA(sum,X,{ground,Y});
  Counter Ctr(Y,countY,clearY,clk);
    always @ (posedge clk)
    begin
      if(clearX) X <= 0;
      else if(loadX) X <= sum;
    end
endmodule

module Controller(countY, clearY, loadX, clearX, done, Y, Nn, Gg, clk);
    output wire countY, clearY, loadX, clearX, done;
  input wire [31:0] Y, Nn;
    input wire Gg, clk;
    wire Z, state0, state1, state2;
    reg [1:0] state;
    parameter S0 = 2'b00,
            S1 = 2'b01,
            S2 = 2'b10;

    wire temp1,temp2;
  Comparator cpr(Z,temp1,temp2,Y,Nn);
    assign state1 = (state == S1);
    assign state2 = (state == S2);  
    assign state0 = (state == S0);

    assign clearY = state0;  
    assign countY = state2;
    assign loadX = state1 && ((Y[1] || Y[2]) && ~ Y[0]);
    assign clearX = state0;
    assign done = Z;

    initial state=S0;

    always @ (posedge clk)
    begin
        case(state)
            S2: if (Z) state <= S0;
            else state <= S1;
            S1: state<= S2;
            S0: if (Gg) state <= S1;
            else state<= S0;
            default: state <=S0;
        endcase
    end


endmodule

module ASM(sum,done,Nn,Gg,clk);
  input wire [31:0] Nn;
  input wire Gg, clk;
  wire countY, clearY, loadX, clearX;
  wire [31:0] Y;
  output wire [63:0] sum;
  output done;
  Datapath datapath(sum,Y,countY, clearY, loadX, clearX, clk);
  Controller controller(countY, clearY, loadX, clearX, done, Y, Nn, Gg, clk);
endmodule
