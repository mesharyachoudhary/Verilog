module TFF(out,T,rst,clk);
    input T,clk,rst;  
    output reg out;
    always @ (posedge clk or posedge rst)
    begin
        if(rst)out<=0;
        else if(T)out<=~out;
    end
endmodule

module DFF(D,clk,rst,Q);
  input clk; // clock input 
  input rst; // synchronous reset 
  input D; // Data input 
  output reg Q; // output Q 
  always @(posedge clk) 
   begin
    if(rst==1'b1)
      Q <= 1'b0; 
    else 
      Q <= D; 
end 
endmodule

module MOD8Counter(out,rst,clk);
    output wire [2:0] out;
    input clk, rst;
    TFF T1(out[0],1'b1,rst,clk);
    TFF T2(out[1],1'b1,rst,~out[0]);
    TFF T3(out[2],1'b1,rst,~out[1]);
endmodule