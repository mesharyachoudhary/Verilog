module test;
  reg x;
  reg clk;
  wire high;

  highlvl hseqdet(x, clk, high);//HIGH LEVEL IMPLEMENTATION
  
  always #10 clk = ~clk;
  
  always @(posedge clk)
  begin
    #5 $display("For input x=%b,the output for high level implementation=%b\n", x,high); //DISPLAYING OUTPUT
  end
  
  initial
    begin
      
      
      $display("TESTING BEGINS");
      clk = 0;
      x=1;#20;
      x=1;#20;
      x=1;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=0;#20;

      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=0;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=1;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=0;#20;
      x=1;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=0;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=0;#20;
      x=1;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=0;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=0;#20;
      x=1;#20;
      if(high)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      $display("TESTING ENDS");
      $finish;
    end
endmodule
