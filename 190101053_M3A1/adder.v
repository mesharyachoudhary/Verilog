module halfadder(S, C, x, y);
 input x, y;
 output S,C;
 xor a(S, x, y);
 and b(C, x, y);
endmodule
module CarryLookAheadGenerator(C1,C2,C3,C4,P,G,C0);
 input [3:0] P,G;
 input C0;
 output C1,C2,C3,C4;
 assign C1=(P[0]&C0)|G[0];
 assign C2=G[1]|(P[1]&G[0])|(P[1]&P[0]&C0);
 assign C3=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C0);
 assign C4=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C0);
endmodule
module CarryLookAheadAdder(V,S,A,B,M);
 input [3:0] A,B;
 input M;
 output [3:0] S;
 output V;
 wire C1,C2,C3,C4;
 wire [3:0] P,G;
 halfadder HA0(P[0],G[0],A[0],B[0]^M);
 halfadder HA1(P[1],G[1],A[1],B[1]^M);
 halfadder HA2(P[2],G[2],A[2],B[2]^M);
 halfadder HA3(P[3],G[3],A[3],B[3]^M);
 CarryLookAheadGenerator CLAG(C1,C2,C3,C4,P,G,M);
 assign S[0]=P[0]^M;
 assign S[1]=P[1]^C1;
 assign S[2]=P[2]^C2;
 assign S[3]=P[3]^C3;
 assign V=C4^C3;
endmodule