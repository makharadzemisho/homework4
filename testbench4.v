`timescale 1ns / 1ps


module testbench4;

	// Inputs
	reg CLK;
	reg [31:0] instruction;

	// Outputs
	wire [2:0] Instruction_type;
	wire [3:0] Dataprocessing_instr_type;

	// Instantiate the Unit Under Test (UUT)
	instdata uut (
		.CLK(CLK), 
		.instruction(instruction), 
		.Instruction_type(Instruction_type), 
		.Dataprocessing_instr_type(Dataprocessing_instr_type)
	);
always #5 CLK = !CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;
		instruction = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		instruction[25]=1;
		#10;
		instruction[25]=0;
		instruction[4]=0;
		#10;
		instruction[4]=1;
		#10
		instruction[7:4]=9;
		#10;
		instruction[27:26]=1;
		#10;
		instruction[25]=0;
		#10;
		instruction[25]=1;
		instruction[4]=1;
		#10;
	end
      
endmodule

