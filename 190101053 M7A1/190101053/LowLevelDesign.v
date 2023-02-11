//Low level verilog HDL Implementation:
//D-FF Module
module DFF(input D, input clk, output out);
  reg Q = 1'b0;
  always @ (posedge clk)
  begin
    Q <= D;
  end
  assign out = Q;
endmodule

module lowlvl(input in, input clk, output out);
  wire NX,Q0,Q1,Q2,NQ0,NQ1,NQ2,D0,D1,D2,exp01,exp02,exp11,exp12; 
  not(NQ0, Q0);
  not(NQ1, Q1);
  not(NQ2, Q2);
  not(NX, in);
  
  DFF df0(D0, clk, Q0);
  DFF df1(D1, clk, Q1);
  DFF df2(D2, clk, Q2);
  
  
  and(exp01,NQ1,NQ2);
  and(exp02, NQ2, NQ0);
  or(D0, exp01,exp02);
  
  and(exp11, NQ2, NQ1, Q0, in);
  and(exp12, NQ2, Q1, Q0, NX);
  or(D1, exp11, exp12);
  
  and(D2, NQ2, NQ1, Q0, NX);
  
  
  and(out, NQ2, Q1, NQ0);
endmodule
