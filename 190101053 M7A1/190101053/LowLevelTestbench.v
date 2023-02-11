module test;
  reg x;
  reg clk;
  wire low;

  lowlvl lseqdet(x, clk, low);//for low level testing
  
  always #10 clk = ~clk;
  
  always @(posedge clk) 
  begin
    #5 $display("For input x=%b,the output for low level implementation=%b\n", x,low); //DISPLAYING OUTPUT
  end
  
  initial
    begin
      
      $display("TESTING BEGINS");
      clk = 0;
      x=1;#20;
      x=1;#20;
      x=1;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=0;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=1;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=0;#20;
      x=1;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=0;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=0;#20;
      x=1;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=0;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=1;#20;
      x=0;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      x=1;#20;
      x=0;#20;
      x=1;#20;
      if(low)
		$display("Found\n");
	else
		$display("Not found\n"); 
      
      $display("TESTING ENDS");
      $finish;
    end
endmodule
