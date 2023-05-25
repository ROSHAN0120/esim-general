\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off LATCH*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off NULLPORT*/  /* verilator lint_off EOFNEWLINE*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  /* verilator lint_off */  /* verilator lint_off */  /* verilator lint_off */  

//Your Verilog/System Verilog Code Starts Here:
/* 
Control unit controls takes opcode, funct7, funct3 of the instruction code to determine
and control regwrite in IFU, alu control in ALU to execute proper instruction
*/
module control1(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control,
    output reg regwrite_control
);
    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions

            regwrite_control = 1;

            case (funct3)
                0: begin
                    if(funct7 == 0)
                    alu_control = 4'b0010; // ADD
                    else if(funct7 == 32)
                    alu_control = 4'b0100; // SUB
                end
                6: alu_control = 4'b0001; // OR
                7: alu_control = 4'b0000; // AND
                1: alu_control = 4'b0011; // SLL
                5: alu_control = 4'b0101; // SRL
				2: alu_control = 4'b0110; // MUL
				4: alu_control = 4'b0111; // XOR
            endcase

      end

    end

endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  [6:0] funct7;//input
		logic  [2:0] funct3;//input
		logic  [6:0] opcode;//input
		logic  [3:0] alu_control;//output
		logic reg write_control;//output
//The $random() can be replaced if user wants to assign values
		assign funct7 = $random();
		assign funct3 = $random();
		assign opcode = $random();
		control1 control1(.funct7(funct7), .funct3(funct3), .opcode(opcode), .alu_control(alu_control), .write_control(write_control));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

