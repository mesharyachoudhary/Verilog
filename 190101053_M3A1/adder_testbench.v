module CarryLookAheadAdder_tb();

	reg [3:0] in0;
	reg [3:0] in1;
    reg M;
	wire [3:0] S;
	wire C,V;

  CarryLookAheadAdder DUT(.V(V),.S(S),.A(in0),.B(in1),.M(M));

	initial begin
		in0 = 4'b0000; in1 = 4'b0000; M=0; #10
		in0 = 4'b0000; in1 = 4'b1110; #10
		in0 = 4'b0000; in1 = 4'b1111; #10
		in0 = 4'b1011; in1 = 4'b0111; #10
		in0 = 4'b1011; in1 = 4'b1000; #10
		in0 = 4'b1111; in1 = 4'b1111; #10
        in0 = 4'b0000; in1 = 4'b0000; M=1; #10
		in0 = 4'b0111; in1 = 4'b1011; #10
		in0 = 4'b1001; in1 = 4'b1010; #10
		in0 = 4'b1011; in1 = 4'b1010; #10
		in0 = 4'b1101; in1 = 4'b1001; #10
		in0 = 4'b1111; in1 = 4'b0111; #10
		in0 = 4'b1111; in1 = 4'b1111;
	end

	initial begin
      $monitor($time, " overflow:%b: %b = %b + %b, %b",V,S,in0,in1,M);
	end

endmodule