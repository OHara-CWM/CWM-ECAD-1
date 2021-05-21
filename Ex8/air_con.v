//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module air_con (
	input clk,
	input [4:0]temperature,
	output heating,
	output cooling
	);

reg [1:0] sequence;

assign cooling = (sequence==2'b01);
assign heating = (sequence==2'b10);

always @(posedge clk)
	begin
	if(sequence==2'b11)
	   sequence<= #1 2'b00;
	else
		if ((temperature <20)&& sequence==2'b10)
		sequence<= #1 2'b10;
	else
		if ((temperature >20)&& sequence==2'b01)
		sequence<= #1 2'b01;
	else
		if ((temperature >=20)&& sequence==2'b10)
		sequence<= #1 2'b00;
	else
		if ((temperature <=20)&& sequence==2'b01)
		sequence<= #1 2'b00;
	else
		if ((temperature <=18)&& sequence==2'b00)
		sequence<= #1 2'b10;
	else
		if ((temperature >=22)&& sequence==2'b00)
		sequence<= #1 2'b01;
	else
		if (sequence==2'b10 && temperature < 22 && temperature >18)
		sequence<= #1 2'b00;
		else
		sequence<= #1 2'b00;
	end

endmodule



