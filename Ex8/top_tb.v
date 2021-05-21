`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2021 09:34:51 AM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb(

    );
    
      //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk_p;
    wire clk_n;
    reg err;
    reg rst;
    reg [4:0] temperature;
    wire heating;
    wire cooling;
    reg direction;
    
   
    
    //Clock generation
    initial
    begin
       clk_p = 1'b0;
       forever
         #(CLK_PERIOD/2) clk_p=~clk_p;
     end
    
    assign clk_n=~clk_p;
    
     //Stimulus logic
     initial begin
       err=0;
       temperature=0;
       direction = 1;
       rst=1;
       #(CLK_PERIOD*10)
       rst=0;
       forever begin
         #(CLK_PERIOD)
	       direction = (temperature==5'd1) ? 1 :(temperature==5'd31) ? 0: direction;
	       temperature = direction? temperature +1:temperature -1;
       end
     end
     
          
      //Finish simulation and check for success
      initial begin
        #100 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

    //User's module
    top test(
    .clk_p(clk_p),
    .clk_n(clk_n),
    .rst_n(rst),
    .temperature_0(temperature[0]),
    .temperature_1(temperature[1]),
    .temperature_2(temperature[2]),
    .temperature_3(temperature[3]),
    .temperature_4(temperature[4]),
    .heating(heating),
    .cooling(cooling)
   );
     

endmodule
