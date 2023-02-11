//High Level verilog HDL Implementation
module highlvl(input in, input clk, output out);
  
  //States
  parameter s0 = 3'b000,
  			s1 = 3'b001,
  			s2 = 3'b010,
  			s3 = 3'b011,
  			s4 = 3'b100;
  
  reg [2:0] state = 3'b000; 
  reg z;
  
  
  always @ (state)
  begin
    if (state == s4)
      z = 1'b1;
    else
      z = 1'b0;
  end
  
  
  
  always @ (posedge clk) 
  begin
    case(state)
      s0: state = s1;
      s1: begin
        if(in == 1'b1) state = s3;
        else state = s2;
      end
      s3: begin
        if(in== 1'b0) state = s4;
        else state = s0;
      end
      s2: state = s0;
      s4: state = s1;
      default: state=s0;
    endcase
  end
  assign out = z;
endmodule
