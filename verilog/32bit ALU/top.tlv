\TLV_version 1d --inlineGen --bestsv --noline --noDirectiveComments: tl-x.org
\SV
   /*
   Copyright 2023 Redwood EDA, LLC
   
   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   */
\SV
   // Include WARP-V.
   
   // Included URL: "https://raw.githubusercontent.com/stevehoover/warp-v/b89fa754262d7d369cf991c09a7c438bc94dd260/warp-v.tlv"// Included URL: "https://raw.githubusercontent.com/stevehoover/tlv_lib/3543cfd9d7ef9ae3b1e5750614583959a672084d/fundamentals_lib.tlv"// Included URL: "https://raw.githubusercontent.com/stevehoover/warp-v_includes/b4c0b50a17d386259be34b03384803609c625d80/risc-v_defs.tlv"
   /* verilator lint_off WIDTH */
   /* verilator lint_off PINMISSING */
   /* verilator lint_off SELRANGE */
   /* verilator lint_off WIDTH */
   /* verilator lint_off CASEINCOMPLETE */
   `include "./sv_url_inc/picorv32_pcpi_div.sv"  // From: "https://raw.githubusercontent.com/stevehoover/warp-v_includes/b4c0b50a17d386259be34b03384803609c625d80/divmul/picorv32_pcpi_div.sv"
   `include "./sv_url_inc/picorv32_pcpi_fast_mul.sv"  // From: "https://raw.githubusercontent.com/stevehoover/warp-v_includes/b4c0b50a17d386259be34b03384803609c625d80/divmul/picorv32_pcpi_fast_mul.sv"
   /* verilator lint_on CASEINCOMPLETE */
   /* verilator lint_on WIDTH */
\SV
   module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */
\TLV
   
   /* verilator lint_on WIDTH */  // Let's be strict about bit widths.
   
   
   // Single Core.
   
   // m5+warpv() (but inlined to reduce macro depth)
   
   // Generated logic
   // Instantiate the _gen macro for the right ISA. (This approach is required for an m5-defined name.)
   
   
   
   // Instruction memory and fetch of $raw.
   
   
   // ==============
   // IMem and Fetch
   // ==============
   
   /* DMEM_STYLE: ARRAY, FORMAL: 0 */
   
   
   
   
   
   // Default to HARDCODED_ARRAY
   // For simulation
   // --------------
   
   // Define the program. (This approach is required for an m5-defined name.)
   
   
   // /==========================\
   // | M-extension Test Program |
   // \==========================/
   //
   //3 MULs followed by 3 DIVs, check r11-r15 for correct results
   // Inst #0: ORI x8, zero, 0b1011
   // Inst #1: ORI x9, zero, 0b1010
   // Inst #2: ORI x10, zero, 0b10101010
   // Inst #3: MUL x11, x8, x9
   // Inst #4: ORI x6, zero, 0b0
   // Inst #5: SW x6, x11, 0b0
   // Inst #6: MUL x12, x9, x10
   // Inst #7: LW x4, x6, 0b0
   // Inst #8: ADDI x6, x6, 0b100
   // Inst #9: SW x6, x12, 0b0
   // Inst #10: MUL x13, x8, x10
   // Inst #11: DIV x14, x11, x8
   // Inst #12: DIV x15, x13, x10
   // Inst #13: LW x5, x6, 0b0
   // Inst #14: ADDI x4, zero, 0b101101
   // Inst #15: BGE x8, x9, 0b111111111110
   \SV_plus
      // The program in an instruction memory.
      logic [31:0] instrs [0:16-1];
      logic [40*8-1:0] instr_strs [0:16];
      
      assign instrs[0] = {12'b1011, 5'd0, 3'b110, 5'd8, 7'b0010011}; assign instrs[1] = {12'b1010, 5'd0, 3'b110, 5'd9, 7'b0010011}; assign instrs[2] = {12'b10101010, 5'd0, 3'b110, 5'd10, 7'b0010011}; assign instrs[3] = {7'b0000001, 5'd9, 5'd8, 3'b000, 5'd11, 7'b0110011}; assign instrs[4] = {12'b0, 5'd0, 3'b110, 5'd6, 7'b0010011}; assign instrs[5] = {7'b0000000, 5'd11, 5'd6, 3'b010, 5'b00000, 7'b0100011}; assign instrs[6] = {7'b0000001, 5'd10, 5'd9, 3'b000, 5'd12, 7'b0110011}; assign instrs[7] = {12'b0, 5'd6, 3'b010, 5'd4, 7'b0000011}; assign instrs[8] = {12'b100, 5'd6, 3'b000, 5'd6, 7'b0010011}; assign instrs[9] = {7'b0000000, 5'd12, 5'd6, 3'b010, 5'b00000, 7'b0100011}; assign instrs[10] = {7'b0000001, 5'd10, 5'd8, 3'b000, 5'd13, 7'b0110011}; assign instrs[11] = {7'b0000001, 5'd8, 5'd11, 3'b100, 5'd14, 7'b0110011}; assign instrs[12] = {7'b0000001, 5'd10, 5'd13, 3'b100, 5'd15, 7'b0110011}; assign instrs[13] = {12'b0, 5'd6, 3'b010, 5'd5, 7'b0000011}; assign instrs[14] = {12'b101101, 5'd0, 3'b000, 5'd4, 7'b0010011}; assign instrs[15] = {1'b0, 6'b111111, 5'd9, 5'd8, 3'b101, 4'b1111, 1'b1, 7'b1100011}; 
      
      // String representations of the instructions for debug.
      assign instr_strs[0] = "(I) ORI x8,zero,0b1011                  "; assign instr_strs[1] = "(I) ORI x9,zero,0b1010                  "; assign instr_strs[2] = "(I) ORI x10,zero,0b10101010             "; assign instr_strs[3] = "(R) MUL x11,x8,x9                       "; assign instr_strs[4] = "(I) ORI x6,zero,0b0                     "; assign instr_strs[5] = "(S) SW x6,x11,0b0                       "; assign instr_strs[6] = "(R) MUL x12,x9,x10                      "; assign instr_strs[7] = "(I) LW x4,x6,0b0                        "; assign instr_strs[8] = "(I) ADDI x6,x6,0b100                    "; assign instr_strs[9] = "(S) SW x6,x12,0b0                       "; assign instr_strs[10] = "(R) MUL x13,x8,x10                      "; assign instr_strs[11] = "(R) DIV x14,x11,x8                      "; assign instr_strs[12] = "(R) DIV x15,x13,x10                     "; assign instr_strs[13] = "(I) LW x5,x6,0b0                        "; assign instr_strs[14] = "(I) ADDI x4,zero,0b101101               "; assign instr_strs[15] = "(B) BGE x8,x9,0b111111111110            "; 
      assign instr_strs[16] = "END                                     ";
   
   |fetch
      
      
      /instr_mem[15:0]
         @0
            $instr[31:0] = *instrs[instr_mem];
            $instr_str[40*8-1:0] = *instr_strs[instr_mem];
   
   
      /instr
         @0
            ?$fetch
               $raw[31:0] = *instrs\[$Pc[5:2]\];




   // /=========\
   // | The CPU |
   // \=========/
   |fetch
      /instr
         
         
         // Provide a longer reset to cover the pipeline depth.
         @-1
            $soft_reset = (1'b0) || *reset;
            $Cnt[7:0] <= $soft_reset   ? 8'b0 :       // reset
                         $Cnt == 8'hFF ? 8'hFF :      // max out to avoid wrapping
                                         $Cnt + 8'b1; // increment
            $reset = $soft_reset || $Cnt < 5;
         @0
            $fetch = ! $reset && ! $NoFetch;
            // (m5_IMEM_MACRO_NAME instantiation produces ?$fetch$raw.)
         @0
            
            // ========
            // Overview
            // ========
            
            // Terminology:
            //
            // Instruction: An instruction, as viewed by the CPU pipeline (i.e. ld and returning_ld are separate instructions,
            //              and the returning_ld and the instruction it clobbers are one in the same).
            // ISA Instruction: An instruction, as defined by the ISA.
            // Good-Path (vs. Bad-Path): On the proper flow of execution of the program, excluding aborted instructions.
            // Path (of an instruction): The sequence of instructions that led to a particular instruction.
            // Current Path: The sequence of instructions fetched by next-PC logic that are not known to be bad-path.
            // Redirect: Adjust the PC from the predicted next-PC.
            // Redirect Shadow: Between the instruction causing the redirect and the redirect target instruction.
            // Bubbles: The cycles in the redirect shadow.
            // Commit: Results are made visible to subsequent instructions.
            // Abort: Do not commit. All aborts are also redirects and put the instruction on bad path. Non-aborting
            //        redirects do not mark the triggering instruction as bad-path. Aborts mask future redirects on the
            //        aborted instruction.
            // Retire: Commit results of an ISA instruction.
            
            // Control flow:
            //
            // Redirects include (earliest to latest):
            //   o Returning load: (aborting) A returning load clobbers an instruction and takes its slot, resulting in a
            //                     one-cycle redirect to repeat the clobbered instruction.
            //   o Predict-taken branch: A predicted-taken branch must determine the target before it can redirect the PC.
            //                           (This might be followed up by a mispredition.)
            //   o Replay: (aborting) Replay the same instruction (because a source register is pending (awaiting a long-latency/2nd issuing instruction))
            //   o Jump: A jump instruction.
            //   o Mispredicted branch: A branch condition was mispredicted.
            //   o Aborting traps: (aborting) illegal instructions, others?
            //   o Non-aborting traps: misaligned PC target
            
            // ==============
            // Redirect Logic
            // ==============
                            
            // PC logic will redirect the PC for conditions on current-path instructions. PC logic keeps track of which
            // instructions are on the current path with a $GoodPathMask. $GoodPathMask[n] of an instruction indicates
            // whether the instruction n instructions prior to this instruction is on its path.
            //
            //                 $GoodPathMask for Redir'edX => {o,X,o,y,y,y,o,o} == {1,1,1,1,0,0,1,1}
            // Waterfall View: |
            //                 V
            // 0:       oooooooo                  Good-path
            // 1: InstX  ooooooXo  (Non-aborting) Good-path
            // 2:         ooooooxx
            // 3: InstY    ooYyyxxx  (Aborting)
            // 4: InstZ     ooyyxZxx
            // 5: Redir'edY  oyyxxxxx
            // 6: TargetY     ooxxxxxx
            // 7: Redir'edX    oxxxxxxx
            // 8: TargetX       oooooooo          Good-path
            // 9: Not redir'edZ  oooooooo         Good-path
            //
            // Above depicts a waterfall diagram where three triggering redirection conditions X, Y, and Z are detected on three different
            // instructions. A trigger in the 1st depicted stage, m5_NEXT_PC_STAGE, results in a zero-bubble redirect so it would be
            // a condition that is factored directly into the next-PC logic of the triggering instruction, and it would have
            // no impact on the $GoodPathMask.
            //
            // Waveform View:
            //
            //   Inst 0123456789
            //        ---------- /
            // GPM[7]        ooxxxxxxoo
            // GPM[6]       oXxxxxxxoo
            // GPM[5]      oooxZxxxoo
            // GPM[4]     oooyxxxxoo
            // GPM[3]    oooyyxxxoo
            // GPM[2]   oooYyyxxoo
            // GPM[1]  oooooyoxoo
            // GPM[0] oooooooooo
            //          /
            //         Triggers for InstY
            //
            // In the waveform view, the mask shifts up each cycle, as instructions age, and trigger conditions mask instructions
            // in the shadow, down to the redirect target (GPM[0]).
            //
            // Terminology:
            //   Triggering instruction: The instruction on which the condition is detected.
            //   Redirected instruction: The instruction whose next PC is redirected.
            //   Redirection target instruction: The first new-path instruction resulting from the redirection.
            //
            // Above, Y redirects first, though it is for a later instruction than X. The redirections for X and Y are taken
            // because their instructions are on the path of the redirected instructions. Z is not on the path of its
            // potentially-redirected instruction, so no redirection happens.
            //
            // For simultaneous conditions on different instructions, the PC must redirect to the earlier instruction's
            // redirect target, so later-stage redirects take priority in the PC-mux.
            //
            // Aborting redirects result in the aborting instruction being marked as bad-path. Aborted instructions will
            // not commit. Subsequent redirect conditions on aborting instructions are ignored. (For conditions within the
            // same stage, this is accomplished by the PC-mux prioritization.)
            
            
            // Macros are defined elsewhere based on the ordered set of conditions that generate code here.
            
            // Redirect Shadow
            // A mask of stages ahead of this one (older) in which instructions are on the path of this instruction.
            // Index 1 is ahead by 1, etc.
            // In the example above, $GoodPathMask for Redir'edX == {0,0,0,0,1,1,0,0}
            //     (Looking up in the waterfall diagram from its first "o", in reverse order {o,X,o,o,y,y,o,o}.)
            // The LSB is fetch-valid. It only exists for m5_prev_instr_valid_through macro.
            $next_good_path_mask[1+1:0] =
               // Shift up and mask w/ redirect conditions.
               {$GoodPathMask[1:0]
                // & terms for each condition (order doesn't matter since masks are the same within a cycle)
                 & ((>>0$second_issue && !(1'b0) && $GoodPathMask[0]) ? {{1{1'b1}}, {1{1'b0}}} : {2{1'b1}}) & ((>>0$NoFetch && !(1'b0 || >>0$second_issue) && $GoodPathMask[0]) ? {{1{1'b1}}, {1{1'b0}}} : {2{1'b1}}) & ((>>0$replay && !(1'b0 || >>0$second_issue || >>0$NoFetch) && $GoodPathMask[0]) ? {{1{1'b1}}, {1{1'b0}}} : {2{1'b1}}) & ((>>0$jump && !(1'b0 || >>0$second_issue || >>0$NoFetch || >>0$replay) && $GoodPathMask[0]) ? {{2{1'b1}}, {0{1'b0}}} : {2{1'b1}}) & ((>>0$mispred_branch && !(1'b0 || >>0$second_issue || >>0$NoFetch || >>0$replay) && $GoodPathMask[0]) ? {{2{1'b1}}, {0{1'b0}}} : {2{1'b1}}) & ((>>0$indirect_jump && !(1'b0 || >>0$second_issue || >>0$NoFetch || >>0$replay) && $GoodPathMask[0]) ? {{2{1'b1}}, {0{1'b0}}} : {2{1'b1}}) & ((>>1$non_pipelined && !(1'b0 || >>1$second_issue || >>1$NoFetch || >>1$replay) && $GoodPathMask[1]) ? {{1{1'b1}}, {1{1'b0}}} : {2{1'b1}}) & ((>>1$aborting_trap && !(1'b0 || >>1$second_issue || >>1$NoFetch || >>1$replay) && $GoodPathMask[1]) ? {{0{1'b1}}, {2{1'b0}}} : {2{1'b1}}) & ((>>1$non_aborting_trap && !(1'b0 || >>1$second_issue || >>1$NoFetch || >>1$replay || >>1$aborting_trap) && $GoodPathMask[1]) ? {{1{1'b1}}, {1{1'b0}}} : {2{1'b1}}),
                1'b1}; // Shift in 1'b1 (fetch-valid).
            
            $GoodPathMask[1+1:0] <=
               <<1$reset ? 3'b0 :  // All bad-path (through self) on reset (next mask based on next reset).
               $next_good_path_mask;
            
            
            
         
            
            
            // A returning load clobbers the instruction.
            // (Could do this with lower latency. Right now it goes through memory pipeline $ANY, and
            //  it is non-speculative. Both could easily be fixed.)
            $second_issue_ld = /top|mem/data>>1$valid_ld && 1'b1;
            $second_issue = ($second_issue_ld || $second_issue_div_mul  );
            // Recirculate returning load or the div_mul_result from /orig_inst scope
            
            // This reduces significantly once $ANY acts on subscope.
            ?$second_issue_ld
               // This scope holds the original load for a returning load.
               /orig_load_inst
                  $ANY = /top|mem/data>>1$ANY;
                  /src[2:1]
                     $ANY = /top|mem/data/src>>1$ANY;
                  
                  
               
            ?$second_issue
               /orig_inst
                  // pull values from /orig_load_inst or /hold_inst depending on which second issue
                  $ANY = |fetch/instr$second_issue_ld ? |fetch/instr/orig_load_inst$ANY : |fetch/instr$second_issue_div_mul ? |fetch/instr/hold_inst>>1$ANY :   |fetch/instr/orig_load_inst$ANY;
                  /src[2:1]
                     $ANY = |fetch/instr$second_issue_ld ? |fetch/instr/orig_load_inst/src$ANY : |fetch/instr$second_issue_div_mul ? |fetch/instr/hold_inst/src>>1$ANY :   |fetch/instr/orig_load_inst/src$ANY;
                  
                  
               
            // Next PC
            $pc_inc[31:2] = $Pc + 30'b1;
            // Current parsing does not allow concatenated state on left-hand-side, so, first, a non-state expression.
            {$next_pc[31:2], $next_no_fetch} =
               $reset ? {29'b0, 2'b0} :  /// Start PC at the assembly code "reset" label or address 0.
               // ? : terms for each condition (order does matter)
               (>>1$non_aborting_trap && !(1'b0 || >>1$second_issue || >>1$NoFetch || >>1$replay || >>1$aborting_trap) && $GoodPathMask[1]) ? {>>1$trap_target, 1'b0} : (>>1$aborting_trap && !(1'b0 || >>1$second_issue || >>1$NoFetch || >>1$replay) && $GoodPathMask[1]) ? {>>1$trap_target, 1'b0} : (>>1$non_pipelined && !(1'b0 || >>1$second_issue || >>1$NoFetch || >>1$replay) && $GoodPathMask[1]) ? {>>1$pc_inc, 1'b1} : (>>0$indirect_jump && !(1'b0 || >>0$second_issue || >>0$NoFetch || >>0$replay) && $GoodPathMask[0]) ? {>>0$indirect_jump_target, 1'b0} : (>>0$mispred_branch && !(1'b0 || >>0$second_issue || >>0$NoFetch || >>0$replay) && $GoodPathMask[0]) ? {>>0$branch_redir_pc, 1'b0} : (>>0$jump && !(1'b0 || >>0$second_issue || >>0$NoFetch || >>0$replay) && $GoodPathMask[0]) ? {>>0$jump_target, 1'b0} : (>>0$replay && !(1'b0 || >>0$second_issue || >>0$NoFetch) && $GoodPathMask[0]) ? {>>0$Pc, 1'b0} : (>>0$NoFetch && !(1'b0 || >>0$second_issue) && $GoodPathMask[0]) ? {>>0$Pc, 1'b1} : (>>0$second_issue && !(1'b0) && $GoodPathMask[0]) ? {>>0$Pc, 1'b0} : 
                          ({$pc_inc, 1'b0});
            // Then as state.
            $Pc[31:2] <= $next_pc;
            $NoFetch <= $next_no_fetch;
         
         @0
            // ======
            // DECODE
            // ======
            // Decode of the fetched instruction
            $valid_decode = $fetch;  // Always decode if we fetch.
            $valid_decode_branch = $valid_decode && $branch;
            // A load that will return later.
            //$split_ld = $spec_ld && 1'b⌈⌉m5_INJECT_RETURNING_LD;
            // Instantiate the program. (This approach is required for an m5-defined name.)
            
            
            // TODO: ?$valid_<stage> conditioning should be replaced by use of m5_prev_instr_valid_through(..).
            ?$valid_decode
               // =================================
         
               // Extract fields of $raw (instruction) into $raw_<field>[x:0].
               {$raw_funct7[6:0], $raw_rs2[4:0], $raw_rs1[4:0], $raw_funct3[2:0], $raw_rd[4:0], $raw_op5[4:0], $raw_op2[1:0]} = $raw;
               `BOGUS_USE($raw_op2)  // Delete once it's used.
               // Extract immediate fields into type-specific signals.
               // (User ISA Manual 2.2, Fig. 2.4)
               $raw_i_imm[31:0] = {{21{$raw[31]}}, $raw[30:20]};
               $raw_s_imm[31:0] = {{21{$raw[31]}}, $raw[30:25], $raw[11:7]};
               $raw_b_imm[31:0] = {{20{$raw[31]}}, $raw[7], $raw[30:25], $raw[11:8], 1'b0};
               $raw_u_imm[31:0] = {$raw[31:12], {12{1'b0}}};
               $raw_j_imm[31:0] = {{12{$raw[31]}}, $raw[19:12], $raw[20], $raw[30:21], 1'b0};
               // Extract other type/instruction-specific fields.
               $raw_shamt[6:0] = $raw[26:20];
               $raw_aq = $raw[26];
               $raw_rl = $raw[25];
               $raw_rs3[4:0] = $raw[31:27];
               $raw_rm[2:0] = $raw_funct3;
               `BOGUS_USE($raw_shamt $raw_aq $raw_rl $raw_rs3 $raw_rm)  // Avoid "unused" messages. Remove these as they become used.
         
               // Instruction type decode
               
               \SV_plus
                  assign $$is_i_type = (((0 | (1 << 5'b00000) | (1 << 5'b00001) | (1 << 5'b00100) | (1 << 5'b00110) | (1 << 5'b11001) | (1 << 5'b11100)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_r_type = (((0 | (1 << 5'b01011) | (1 << 5'b01100) | (1 << 5'b01110) | (1 << 5'b10100)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_r2_type = (((0) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_r4_type = (((0 | (1 << 5'b10000) | (1 << 5'b10001) | (1 << 5'b10010) | (1 << 5'b10011)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_s_type = (((0 | (1 << 5'b01000) | (1 << 5'b01001)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_b_type = (((0 | (1 << 5'b11000)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_j_type = (((0 | (1 << 5'b11011)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_u_type = (((0 | (1 << 5'b00101) | (1 << 5'b01101)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is___type = (((0 | (1 << 5'b00010) | (1 << 5'b00011) | (1 << 5'b00111) | (1 << 5'b01010) | (1 << 5'b01111) | (1 << 5'b10101) | (1 << 5'b10110) | (1 << 5'b10111) | (1 << 5'b11010) | (1 << 5'b11101) | (1 << 5'b11110) | (1 << 5'b11111)) >> $raw_op5) & 32'b1) != 32'b0; 
            
         
               // Instruction decode.
               
               $is_lui_instr = $raw_op5 == 5'b01101;
               $is_auipc_instr = $raw_op5 == 5'b00101;
               $is_jal_instr = $raw_op5 == 5'b11011;
               $is_jalr_instr = $raw_op5 == 5'b11001 && $raw_funct3 == 3'b000;
               $is_beq_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b000;
               $is_bne_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b001;
               $is_blt_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b100;
               $is_bge_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b101;
               $is_bltu_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b110;
               $is_bgeu_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b111;
               $is_lb_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b000;
               $is_lh_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b001;
               $is_lw_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b010;
               $is_lbu_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b100;
               $is_lhu_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b101;
               $is_sb_instr = $raw_op5 == 5'b01000 && $raw_funct3 == 3'b000;
               $is_sh_instr = $raw_op5 == 5'b01000 && $raw_funct3 == 3'b001;
               $is_sw_instr = $raw_op5 == 5'b01000 && $raw_funct3 == 3'b010;
               $is_addi_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b000;
               $is_slti_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b010;
               $is_sltiu_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b011;
               $is_xori_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b100;
               $is_ori_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b110;
               $is_andi_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b111;
               $is_slli_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b001 && $raw_funct7[6:1] == 6'b000000;
               $is_srli_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b101 && $raw_funct7[6:1] == 6'b000000;
               $is_srai_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b101 && $raw_funct7[6:1] == 6'b010000;
               $is_add_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b000 && $raw_funct7[6:0] == 7'b0000000;
               $is_sub_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b000 && $raw_funct7[6:0] == 7'b0100000;
               $is_sll_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b001 && $raw_funct7[6:0] == 7'b0000000;
               $is_slt_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b010 && $raw_funct7[6:0] == 7'b0000000;
               $is_sltu_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b011 && $raw_funct7[6:0] == 7'b0000000;
               $is_xor_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b100 && $raw_funct7[6:0] == 7'b0000000;
               $is_srl_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b101 && $raw_funct7[6:0] == 7'b0000000;
               $is_sra_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b101 && $raw_funct7[6:0] == 7'b0100000;
               $is_or_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b110 && $raw_funct7[6:0] == 7'b0000000;
               $is_and_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b111 && $raw_funct7[6:0] == 7'b0000000;
               $is_csrrw_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b001;
               $is_csrrs_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b010;
               $is_csrrc_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b011;
               $is_csrrwi_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b101;
               $is_csrrsi_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b110;
               $is_csrrci_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b111;
               $is_mul_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b000 && $raw_funct7[6:0] == 7'b0000001;
               $is_mulh_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b001 && $raw_funct7[6:0] == 7'b0000001;
               $is_mulhsu_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b010 && $raw_funct7[6:0] == 7'b0000001;
               $is_mulhu_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b011 && $raw_funct7[6:0] == 7'b0000001;
               $is_div_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b100 && $raw_funct7[6:0] == 7'b0000001;
               $is_divu_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b101 && $raw_funct7[6:0] == 7'b0000001;
               $is_rem_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b110 && $raw_funct7[6:0] == 7'b0000001;
               $is_remu_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b111 && $raw_funct7[6:0] == 7'b0000001;
               
            
               
               
               
               // Instruction requires integer mul/div unit and is long-latency.
               $divtype_instr = ($is_div_instr || $is_divu_instr || $is_rem_instr || $is_remu_instr);
               $multype_instr = ($is_mul_instr || $is_mulh_instr || $is_mulhsu_instr || $is_mulhu_instr);
               $div_mul       = ($multype_instr || $divtype_instr);
            
            
         
               
               
            
               
               
               
            
         
               $is_srli_srai_instr = $is_srli_instr || $is_srai_instr;
               // Some I-type instructions have a funct7 field rather than immediate bits, so these must factor into the illegal instruction expression explicitly.
               $illegal_itype_with_funct7 = ( $is_srli_srai_instr  ) && | {$raw_funct7[6], $raw_funct7[4:0]};
               $illegal = ($illegal_itype_with_funct7 && ! $is_lui_instr && ! $is_auipc_instr && ! $is_jal_instr && ! $is_jalr_instr && ! $is_beq_instr && ! $is_bne_instr && ! $is_blt_instr && ! $is_bge_instr && ! $is_bltu_instr && ! $is_bgeu_instr && ! $is_lb_instr && ! $is_lh_instr && ! $is_lw_instr && ! $is_lbu_instr && ! $is_lhu_instr && ! $is_sb_instr && ! $is_sh_instr && ! $is_sw_instr && ! $is_addi_instr && ! $is_slti_instr && ! $is_sltiu_instr && ! $is_xori_instr && ! $is_ori_instr && ! $is_andi_instr && ! $is_slli_instr && ! $is_srli_instr && ! $is_srai_instr && ! $is_add_instr && ! $is_sub_instr && ! $is_sll_instr && ! $is_slt_instr && ! $is_sltu_instr && ! $is_xor_instr && ! $is_srl_instr && ! $is_sra_instr && ! $is_or_instr && ! $is_and_instr && ! $is_csrrw_instr && ! $is_csrrs_instr && ! $is_csrrc_instr && ! $is_csrrwi_instr && ! $is_csrrsi_instr && ! $is_csrrci_instr && ! $is_mul_instr && ! $is_mulh_instr && ! $is_mulhsu_instr && ! $is_mulhu_instr && ! $is_div_instr && ! $is_divu_instr && ! $is_rem_instr && ! $is_remu_instr) ||
                          ($raw[1:0] != 2'b11); // All legal instructions have opcode[1:0] == 2'b11. We ignore these bits in decode logic.
               $conditional_branch = $is_b_type;
            $jump = $is_jal_instr;  // "Jump" in RISC-V means unconditional. (JALR is a separate redirect condition.)
            $branch = $is_b_type;
            $indirect_jump = $is_jalr_instr;
            ?$valid_decode
               $ld = $raw[6:3] == 4'b0;
               $st = $is_s_type;
               $ld_st = $ld || $st;
               $ld_st_word = $ld_st && ($raw_funct3[1] == 1'b1);
               $ld_st_half = $ld_st && ($raw_funct3[1:0] == 2'b01);
               //$ld_st_byte = $ld_st && ($raw_funct3[1:0] == 2'b00);
               `BOGUS_USE($is___type $is_u_type)
         
               // Output signals.
               /src[2:1]
                  // Reg valid for this source, based on instruction type.
                  $is_reg =
                      
                      (/instr$is_r_type || /instr$is_r4_type || (/instr$is_i_type && (#src == 1)) || /instr$is_r2_type || /instr$is_s_type || /instr$is_b_type);
                  $reg[4:0] = (#src == 1) ? /instr$raw_rs1[4:0] : /instr$raw_rs2[4:0];
                  
            // Condition signals must not themselves be conditioned (currently).
            $dest_reg[4:0] = $second_issue_div_mul ? |fetch/instr/hold_inst>>1$dest_reg :
                                             
                                             $second_issue_ld ? |fetch/instr/orig_inst$dest_reg : $raw_rd[4:0];
            $dest_reg_valid =  (($valid_decode && ! $is_s_type && ! $is_b_type) || $second_issue) &&
                              | $dest_reg;   // r0 not valid.  TODO: Huh? What about FP? No formal failure?
            
            
            
         
            
            // Actually load.
            $spec_ld = $valid_decode && $ld;
            
            // CSR decode.
            $is_csr_write = $is_csrrw_instr || $is_csrrwi_instr;
            $is_csr_set   = $is_csrrs_instr || $is_csrrsi_instr;
            $is_csr_clear = $is_csrrc_instr || $is_csrrci_instr;
            $is_csr_instr = $is_csr_write ||
                            $is_csr_set   ||
                            $is_csr_clear;
            $valid_csr = 1'b0 || $is_csr_cycle || $is_csr_cycleh || $is_csr_time || $is_csr_timeh || $is_csr_instret || $is_csr_instreth;
            $csr_trap = $is_csr_instr && ! $valid_csr;
         
         // Instantiate the program. (This approach is required for an m5-defined name.)
         
         
         @0
            $pred_taken = 1'b0;
      
         
         @0
            // Pending value to write to dest reg. Loads (not replaced by returning ld) write pending.
            $reg_wr_pending = $ld && ! $second_issue && 1'b1;
            `BOGUS_USE($reg_wr_pending)  // Not used if no bypass and no pending.
            
            // ======
            // Reg Rd
            // ======
            
            // Obtain source register values and pending bit for source registers.
            
            // Obtain source register values and pending bit for int or fp source registers. Bypass up to 3
            // stages.
            // It is not necessary to bypass pending, as we could delay the replay, but we implement
            // bypass for performance.
            // Pending has an additional read for the dest register as we need to replay for write-after-write
            // hazard as well as write-after-read. To replay for dest write with the same timing, we must also
            // bypass the dest reg's pending bit.
            
            
            
            /src[2:1]
               $is_reg_condition = $is_reg && /instr$valid_decode;  // Note: $is_reg can be set for RISC-V sr0.
               ?$is_reg_condition
                  $rf_value[31:0] =
                       /instr/regs[$reg]>>0$value;
                  /* verilator lint_off WIDTH */  // TODO: Disabling WIDTH to work around what we think is https://github.com/verilator/verilator/issues/1613, when --fmtPackAll is in use.
                  {$reg_value[31:0], $pending} =
                     ($reg == 5'b0) ? {32'b0, 1'b0} :  // Read r0 as 0 (not pending).⌈⌉m5_set(status, ⌈⌉)
                     // Bypass stages. Both register and pending are bypassed.
                     // Bypassed registers must be from instructions that are good-path as of this instruction or are 2nd issuing.
                     
                     
                     
                     {$rf_value, /instr/regs[$reg]>>0$pending};
                  /* verilator lint_on WIDTH */
               // Replay if source register is pending.
               $replay = $is_reg_condition && $pending;
            
            // Also replay for pending dest reg to keep writes in order. Bypass dest reg pending to support this.
            $is_dest_condition = $dest_reg_valid && /instr$valid_decode;
            ?$is_dest_condition
               $dest_pending =
                  ($dest_reg == 5'b0) ? 1'b0 :  // Read r0 as 0 (not pending). Not actually necessary, but it cuts off read of non-existent rs0, which might be an issue for formal verif tools.⌈⌉m5_set(status, ⌈⌉)
                  // Bypass stages.
                  
                  
                  
                  /regs[$dest_reg]>>0$pending;
            // Combine replay conditions for pending source or dest registers.
            $pending_replay = | /src[*]$replay || ($is_dest_condition && $dest_pending);
         
            /src[*]
               $dummy = 1'b0;  // Dummy signal to pull through $ANY expressions when not building verification harness (since SandPiper currently complains about empty $ANY).
            
            
            
         
            $replay = ($pending_replay );
         
         // =======
         // Execute
         // =======
         
         // Instantiate the program. (This approach is required for an m5-defined name.)
         
         
         // if M_EXT is enabled, this handles the stalling logic
         
      
         // RISC-V M-Extension instructions in WARP-V are fixed latency
         // As of today, to handle those instructions, WARP-V pipeline is stalled for the given latency, and the
         // results are written back through a second issue at the end of stalling duration.
         // Verilog modules are inherited from PicoRV32, and are located in the ./muldiv directory.
         // Since the modules have a fixed latency, their valid signals are instantiated as valid decode for M-type
         // instructions is detected, and results are put in /orig_inst scope to be used in second issue.
      
         // This macro handles the stalling logic using a counter, and triggers second issue accordingly.
      
         // latency for division is different for ALTOPS case
         
              
         
                // latency for multiplication is 2 cycles in case of ALTOPS,
                                      // but we flop it for 5 cycles (in rslt_mux) to augment the normal
                                      // second issue behavior
      
         // Relative to typical 1-cycle latency instructions.
      
         @0
            $second_issue_div_mul = >>1$trigger_next_pc_div_mul_second_issue;
         @0
            {$div_stall, $mul_stall, $stall_cnt[5:0]} =    $reset ? '0 :
                                                           $second_issue_div_mul ? '0 :
                                                           ($commit && $div_mul) ? {$divtype_instr, $multype_instr, 6'b1} :
                                                           >>1$div_stall ? {1'b1, 1'b0, >>1$stall_cnt + 6'b1} :
                                                           >>1$mul_stall ? {1'b0, 1'b1, >>1$stall_cnt + 6'b1} :
                                                           '0;
                                                           
            $stall_cnt_upper_mul = ($stall_cnt == 5);
            $stall_cnt_upper_div = ($stall_cnt == 37);
            $trigger_next_pc_div_mul_second_issue = ($div_stall && $stall_cnt_upper_div) || ($mul_stall && $stall_cnt_upper_mul);
      
      
         // if F_EXT is enabled, this handles the stalling logic
         
      
         // if B_EXT is enabled, this handles the stalling logic
         
         
         @0
            ?$valid_decode_branch
               $branch_target[31:2] = $Pc[31:2] + $raw_b_imm[31:2];
               $misaligned_pc = | $raw_b_imm[1:0];
            ?$jump  // (JAL, not JALR)
               $jump_target[31:2] = $Pc[31:2] + $raw_j_imm[31:2];
               $misaligned_jump_target = $raw_j_imm[1];
         @0
            // Execution.
            $valid_exe = $valid_decode; // Execute if we decoded.
            
            
            // Verilog instantiation must happen outside when conditions' scope
            $divblk_valid = $divtype_instr && $commit;
            $mulblk_valid = $multype_instr && $commit;
            /* verilator lint_off WIDTH */
            /* verilator lint_off CASEINCOMPLETE */   
            
            /mul1      
               
               // instr type is one hot encoding of the required M type instruction
               // the idea is to concatenate is_*_instr from WARP-V and pass on to this module
                  
               $opcode[2:0] = (|fetch/instr$instr_type_mul == 4'b0001) ? 3'b000 : // mull 
                              (|fetch/instr$instr_type_mul == 4'b0010) ? 3'b001 : // mulh
                              (|fetch/instr$instr_type_mul == 4'b0100) ? 3'b010 : // mulhsu
                              (|fetch/instr$instr_type_mul == 4'b1000) ? 3'b011 : // mulhu
                                                               3'b000 ; // default to mul, but this case 
                                                                        // should not be encountered ideally
         
               $mul_insn[31:0] = {7'b0000001,10'b0011000101,$opcode,5'b00101,7'b0110011};
                              // {  funct7  ,{rs2, rs1} (X), funct3, rd (X),  opcode  }   
               // this module is located in ./muldiv/picorv32_pcpi_fast_mul.sv
               \SV_plus      
                     picorv32_pcpi_fast_mul #(.EXTRA_MUL_FFS(1), .EXTRA_INSN_FFS(1), .MUL_CLKGATE(0)) mul(
                           .clk           (|fetch/instr$clk), 
                           .resetn        (|fetch/instr$resetn),
                           .pcpi_valid    (|fetch/instr$mulblk_valid),
                           .pcpi_insn     ($mul_insn),
                           .pcpi_rs1      (|fetch/instr$mul_in1),
                           .pcpi_rs2      (|fetch/instr$mul_in2),
                           .pcpi_wr       (|fetch/instr$$wrm),
                           .pcpi_rd       (|fetch/instr$$mulblock_rslt[31:0]),
                           .pcpi_wait     (|fetch/instr$$waitm),
                           .pcpi_ready    (|fetch/instr$$readym)
                     );
            
         
            
            /div1
               
               // instr type is one hot encoding of the required M type instruction
               // the idea is to concatenate is_*_instr from WARP-V and pass on to this module
                  
               $opcode[2:0] = (|fetch/instr$instr_type_div == 4'b0001 ) ? 3'b100 : // div
                              (|fetch/instr$instr_type_div == 4'b0010 ) ? 3'b101 : // divu
                              (|fetch/instr$instr_type_div == 4'b0100 ) ? 3'b110 : // rem
                              (|fetch/instr$instr_type_div == 4'b1000 ) ? 3'b111 : // remu
                                                                3'b100 ; // default to div, but this case 
                                                                         // should not be encountered ideally
               $div_insn[31:0] = {7'b0000001,10'b0011000101,3'b000,5'b00101,7'b0110011} | ($opcode << 12);
                              // {  funct7  ,{rs2, rs1} (X), funct3, rd (X),  opcode  }   
               // this module is located in ./muldiv/picorv32_div_opt.sv
               \SV_plus
                     picorv32_pcpi_div div(
                           .clk           (|fetch/instr$clk), 
                           .resetn        (|fetch/instr$resetn),
                           .pcpi_valid    (|fetch/instr>>1$div_stall),
                           .pcpi_insn     ($div_insn),
                           .pcpi_rs1      (|fetch/instr$div_in1),
                           .pcpi_rs2      (|fetch/instr$div_in2),
                           .pcpi_rd       (|fetch/instr$$divblock_rslt[31:0]),
                           .pcpi_wait     (|fetch/instr$$waitd),
                           .pcpi_wr       (|fetch/instr$$wrd),
                           .pcpi_ready    (|fetch/instr$$readyd)
                        );
         
            // for the division module, the valid signal must be asserted for the entire computation duration, hence >>1$div_stall is used for this purpose
            // for multiplication it is just a single cycle pulse to start operating
               
            /* verilator lint_on CASEINCOMPLETE */
            /* verilator lint_on WIDTH */
            // use $ANY for passing attributes from long-latency div/mul instructions into the pipeline 
            // stall_cnt_upper_div indicates that the results for div module are ready. The second issue of the instruction takes place
            // m5_NON_PIPELINED_BUBBLES after this point (depending on pipeline depth)
            // retain till next M-type instruction, to be used again at second issue
         
         
       
            
            
         
            
            
            
            
         
      
            // hold_inst scope is not needed when long latency instructions are disabled
            
            // ORed with 1'b0 for maintaining correct behavior for all 3 combinations of F & M, only F and only M.
            // TODO: This becomes a one-liner once $ANY acts on subscope.
            /hold_inst
               $ANY = 1'b0  || (|fetch/instr$mulblk_valid || (|fetch/instr$div_stall && |fetch/instr$commit))   ? |fetch/instr$ANY : >>1$ANY;
               /src[2:1]
                  $ANY = 1'b0  || (|fetch/instr$mulblk_valid || (|fetch/instr$div_stall && |fetch/instr$commit))   ? |fetch/instr/src$ANY : >>1$ANY;
               
               
            
            
            // Compute results for each instruction, independent of decode (power-hungry, but fast).
            ?$valid_exe
               $equal = /src[1]$reg_value == /src[2]$reg_value;
            ?$branch
               $taken =
                  $is_j_type ||
                  ($is_beq_instr && $equal) ||
                  ($is_bne_instr && ! $equal) ||
                  (($is_blt_instr || $is_bltu_instr || $is_bge_instr || $is_bgeu_instr) &&
                   (($is_bge_instr || $is_bgeu_instr) ^
                    (({($is_blt_instr ^ /src[1]$reg_value[31]), /src[1]$reg_value[31-1:0]} <
                      {($is_blt_instr ^ /src[2]$reg_value[31]), /src[2]$reg_value[31-1:0]}
                     ) ^ ((/src[1]$reg_value[31] != /src[2]$reg_value[31]) & $is_bge_instr)
                    )
                   )
                  );
            ?$indirect_jump  // (JALR)
               $indirect_jump_full_target[31:0] = /src[1]$reg_value + $raw_i_imm;
               $indirect_jump_target[31:2] = $indirect_jump_full_target[31:2];
               $misaligned_indirect_jump_target = $indirect_jump_full_target[1];
            ?$valid_exe
               // Compute each individual instruction result, combined per-instruction by a macro.
               // TODO: Could provide some macro magic to specify combined instructions w/ a single result and mux select.
               //       This would reduce code below and probably improve implementation.
               
               $lui_rslt[31:0]   = {$raw_u_imm[31:12], 12'b0};
               $auipc_rslt[31:0] = {$Pc, 2'b0} + $raw_u_imm;
               $jal_rslt[31:0]   = {$Pc, 2'b0} + 4;
               $jalr_rslt[31:0]  = {$Pc, 2'b0} + 4;
               // Load instructions. If returning ld is enabled, load instructions write no meaningful result, so we use zeros.
               
               
               $lb_rslt[31:0]    = 32'b0;
               $lh_rslt[31:0]    = 32'b0;
               $lw_rslt[31:0]    = 32'b0;
               $lbu_rslt[31:0]   = 32'b0;
               $lhu_rslt[31:0]   = 32'b0;
               
               
               
            
            
               $addi_rslt[31:0]  = /src[1]$reg_value + $raw_i_imm;  // TODO: This has its own adder; could share w/ add/sub.
               $xori_rslt[31:0]  = /src[1]$reg_value ^ $raw_i_imm;
               $ori_rslt[31:0]   = /src[1]$reg_value | $raw_i_imm;
               $andi_rslt[31:0]  = /src[1]$reg_value & $raw_i_imm;
               $slli_rslt[31:0]  = /src[1]$reg_value << $raw_i_imm[5:0];
               $srli_intermediate_rslt[31:0] = /src[1]$reg_value >> $raw_i_imm[5:0];
               $srai_intermediate_rslt[31:0] = /src[1]$reg_value[31] ? $srli_intermediate_rslt | ((32'b0 - 1) << (32 - $raw_i_imm[5:0]) ): $srli_intermediate_rslt;
               $srl_rslt[31:0]   = /src[1]$reg_value >> /src[2]$reg_value[4:0];
               $sra_rslt[31:0]   = /src[1]$reg_value[31] ? $srl_rslt | ((32'b0 - 1) << (32 - /src[2]$reg_value[4:0]) ): $srl_rslt;
               $slti_rslt[31:0]  =  (/src[1]$reg_value[31] == $raw_i_imm[31]) ? $sltiu_rslt : {31'b0,/src[1]$reg_value[31]};
               $sltiu_rslt[31:0] = (/src[1]$reg_value < $raw_i_imm) ? 1 : 0;
               $srai_rslt[31:0]  = $srai_intermediate_rslt;
               $srli_rslt[31:0]  = $srli_intermediate_rslt;
               $add_sub_rslt[31:0] = ($raw_funct7[5] == 1) ?  /src[1]$reg_value - /src[2]$reg_value : /src[1]$reg_value + /src[2]$reg_value;
               $add_rslt[31:0]   = $add_sub_rslt;
               $sub_rslt[31:0]   = $add_sub_rslt;
               $sll_rslt[31:0]   = /src[1]$reg_value << /src[2]$reg_value[4:0];
               $slt_rslt[31:0]   = (/src[1]$reg_value[31] == /src[2]$reg_value[31]) ? $sltu_rslt : {31'b0,/src[1]$reg_value[31]};
               $sltu_rslt[31:0]  = (/src[1]$reg_value < /src[2]$reg_value) ? 1 : 0;
               $xor_rslt[31:0]   = /src[1]$reg_value ^ /src[2]$reg_value;
               $or_rslt[31:0]    = /src[1]$reg_value | /src[2]$reg_value;
               $and_rslt[31:0]   = /src[1]$reg_value & /src[2]$reg_value;
               // CSR read instructions have the same result expression. Counting on synthesis to optimize result mux.
               $csrrw_rslt[31:0]  = $is_csr_instreth ? {{0{1'b0}},$csr_instreth} : $is_csr_instret ? {{0{1'b0}},$csr_instret} : $is_csr_timeh ? {{0{1'b0}},$csr_timeh} : $is_csr_time ? {{0{1'b0}},$csr_time} : $is_csr_cycleh ? {{0{1'b0}},$csr_cycleh} : $is_csr_cycle ? {{0{1'b0}},$csr_cycle} : 32'bx;
               $csrrs_rslt[31:0]  = $csrrw_rslt;
               $csrrc_rslt[31:0]  = $csrrw_rslt;
               $csrrwi_rslt[31:0] = $csrrw_rslt;
               $csrrsi_rslt[31:0] = $csrrw_rslt;
               $csrrci_rslt[31:0] = $csrrw_rslt;
               
               // "M" Extension.
               
               
               
               // for Verilog modules instantiation
               $clk = *clk;
               $resetn = !(*reset);
                  
               $instr_type_mul[3:0]    = $reset ? '0 : $mulblk_valid ? {$is_mulhu_instr,$is_mulhsu_instr,$is_mulh_instr,$is_mul_instr} : $RETAIN;
               $mul_in1[31:0] = $reset ? '0 : $mulblk_valid ? /src[1]$reg_value : $RETAIN;
               $mul_in2[31:0] = $reset ? '0 : $mulblk_valid ? /src[2]$reg_value : $RETAIN;
                  
               $instr_type_div[3:0]    = $reset ? '0 : $divblk_valid ? {$is_remu_instr,$is_rem_instr,$is_divu_instr,$is_div_instr} : $RETAIN;
               $div_in1[31:0] = $reset ? '0 : $divblk_valid ? /src[1]$reg_value : $RETAIN;
               $div_in2[31:0] = $reset ? '0 : $divblk_valid ? /src[2]$reg_value : $RETAIN;
                  
               // result signals for div/mul can be pulled down to 0 here, as they are assigned only in the second issue
                  
               $mul_rslt[31:0]      = 32'b0;
               $mulh_rslt[31:0]     = 32'b0;
               $mulhsu_rslt[31:0]   = 32'b0;
               $mulhu_rslt[31:0]    = 32'b0;
               $div_rslt[31:0]      = 32'b0;
               $divu_rslt[31:0]     = 32'b0;
               $rem_rslt[31:0]      = 32'b0;
               $remu_rslt[31:0]     = 32'b0;
               `BOGUS_USE ($wrm $wrd $readyd $readym $waitm $waitd)
            
            
            
               // "F" Extension.
               
               // TODO: Move this under /fpu.
               
               
            
               
               
               
            
      
         // CSR logic
         // ---------
         
         // TODO: This doesn't maintain alignment. Need an m5+foreach macro.
         
         
         //--------------
         // CSR CYCLE
         //--------------
         @0
            $is_csr_cycle = $raw[31:20] == 12'hC00;
         @0
            // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
            // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
            
            
            
            
            // hw_wr_mask conditioned by hw_wr.
            $csr_cycle_hw_wr_en_mask[31:0] = {32{$csr_cycle_hw_wr}} & $csr_cycle_hw_wr_mask;
            // The CSR value, updated by side-effect writes.
            $upd_csr_cycle[31:0] =
                 ($csr_cycle_hw_wr_en_mask & $csr_cycle_hw_wr_value) | (~ $csr_cycle_hw_wr_en_mask & $csr_cycle);
         
         
            
            
            // Next value of the CSR.
            $csr_cycle_masked_wr_value[31:0] =
                 $csr_wr_value[31:0] & {32{1'b1}};
            <<1$csr_cycle[31:0] =
                 $reset ? 32'b0 :
                 ! $commit
                        ? $upd_csr_cycle :
                 $is_csr_write && $is_csr_cycle
                        ? $csr_cycle_masked_wr_value | ($upd_csr_cycle & ~ {32{1'b1}}) :
                 $is_csr_set   && $is_csr_cycle
                        ? $upd_csr_cycle |   $csr_cycle_masked_wr_value :
                 $is_csr_clear && $is_csr_cycle
                        ? $upd_csr_cycle & ~ $csr_cycle_masked_wr_value :
                 // No CSR instruction update, only h/w side-effects.
                          $upd_csr_cycle;
         
         
      
         
         
         //--------------
         // CSR CYCLEH
         //--------------
         @0
            $is_csr_cycleh = $raw[31:20] == 12'hC80;
         @0
            // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
            // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
            
            
            
            
            // hw_wr_mask conditioned by hw_wr.
            $csr_cycleh_hw_wr_en_mask[31:0] = {32{$csr_cycleh_hw_wr}} & $csr_cycleh_hw_wr_mask;
            // The CSR value, updated by side-effect writes.
            $upd_csr_cycleh[31:0] =
                 ($csr_cycleh_hw_wr_en_mask & $csr_cycleh_hw_wr_value) | (~ $csr_cycleh_hw_wr_en_mask & $csr_cycleh);
         
         
            
            
            // Next value of the CSR.
            $csr_cycleh_masked_wr_value[31:0] =
                 $csr_wr_value[31:0] & {32{1'b1}};
            <<1$csr_cycleh[31:0] =
                 $reset ? 32'b0 :
                 ! $commit
                        ? $upd_csr_cycleh :
                 $is_csr_write && $is_csr_cycleh
                        ? $csr_cycleh_masked_wr_value | ($upd_csr_cycleh & ~ {32{1'b1}}) :
                 $is_csr_set   && $is_csr_cycleh
                        ? $upd_csr_cycleh |   $csr_cycleh_masked_wr_value :
                 $is_csr_clear && $is_csr_cycleh
                        ? $upd_csr_cycleh & ~ $csr_cycleh_masked_wr_value :
                 // No CSR instruction update, only h/w side-effects.
                          $upd_csr_cycleh;
         
         
      
         
         
         //--------------
         // CSR TIME
         //--------------
         @0
            $is_csr_time = $raw[31:20] == 12'hC01;
         @0
            // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
            // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
            
            
            
            
            // hw_wr_mask conditioned by hw_wr.
            $csr_time_hw_wr_en_mask[31:0] = {32{$csr_time_hw_wr}} & $csr_time_hw_wr_mask;
            // The CSR value, updated by side-effect writes.
            $upd_csr_time[31:0] =
                 ($csr_time_hw_wr_en_mask & $csr_time_hw_wr_value) | (~ $csr_time_hw_wr_en_mask & $csr_time);
         
         
            
            
            // Next value of the CSR.
            $csr_time_masked_wr_value[31:0] =
                 $csr_wr_value[31:0] & {32{1'b1}};
            <<1$csr_time[31:0] =
                 $reset ? 32'b0 :
                 ! $commit
                        ? $upd_csr_time :
                 $is_csr_write && $is_csr_time
                        ? $csr_time_masked_wr_value | ($upd_csr_time & ~ {32{1'b1}}) :
                 $is_csr_set   && $is_csr_time
                        ? $upd_csr_time |   $csr_time_masked_wr_value :
                 $is_csr_clear && $is_csr_time
                        ? $upd_csr_time & ~ $csr_time_masked_wr_value :
                 // No CSR instruction update, only h/w side-effects.
                          $upd_csr_time;
         
         
      
         
         
         //--------------
         // CSR TIMEH
         //--------------
         @0
            $is_csr_timeh = $raw[31:20] == 12'hC81;
         @0
            // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
            // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
            
            
            
            
            // hw_wr_mask conditioned by hw_wr.
            $csr_timeh_hw_wr_en_mask[31:0] = {32{$csr_timeh_hw_wr}} & $csr_timeh_hw_wr_mask;
            // The CSR value, updated by side-effect writes.
            $upd_csr_timeh[31:0] =
                 ($csr_timeh_hw_wr_en_mask & $csr_timeh_hw_wr_value) | (~ $csr_timeh_hw_wr_en_mask & $csr_timeh);
         
         
            
            
            // Next value of the CSR.
            $csr_timeh_masked_wr_value[31:0] =
                 $csr_wr_value[31:0] & {32{1'b1}};
            <<1$csr_timeh[31:0] =
                 $reset ? 32'b0 :
                 ! $commit
                        ? $upd_csr_timeh :
                 $is_csr_write && $is_csr_timeh
                        ? $csr_timeh_masked_wr_value | ($upd_csr_timeh & ~ {32{1'b1}}) :
                 $is_csr_set   && $is_csr_timeh
                        ? $upd_csr_timeh |   $csr_timeh_masked_wr_value :
                 $is_csr_clear && $is_csr_timeh
                        ? $upd_csr_timeh & ~ $csr_timeh_masked_wr_value :
                 // No CSR instruction update, only h/w side-effects.
                          $upd_csr_timeh;
         
         
      
         
         
         //--------------
         // CSR INSTRET
         //--------------
         @0
            $is_csr_instret = $raw[31:20] == 12'hC02;
         @0
            // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
            // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
            
            
            
            
            // hw_wr_mask conditioned by hw_wr.
            $csr_instret_hw_wr_en_mask[31:0] = {32{$csr_instret_hw_wr}} & $csr_instret_hw_wr_mask;
            // The CSR value, updated by side-effect writes.
            $upd_csr_instret[31:0] =
                 ($csr_instret_hw_wr_en_mask & $csr_instret_hw_wr_value) | (~ $csr_instret_hw_wr_en_mask & $csr_instret);
         
         
            
            
            // Next value of the CSR.
            $csr_instret_masked_wr_value[31:0] =
                 $csr_wr_value[31:0] & {32{1'b1}};
            <<1$csr_instret[31:0] =
                 $reset ? 32'b0 :
                 ! $commit
                        ? $upd_csr_instret :
                 $is_csr_write && $is_csr_instret
                        ? $csr_instret_masked_wr_value | ($upd_csr_instret & ~ {32{1'b1}}) :
                 $is_csr_set   && $is_csr_instret
                        ? $upd_csr_instret |   $csr_instret_masked_wr_value :
                 $is_csr_clear && $is_csr_instret
                        ? $upd_csr_instret & ~ $csr_instret_masked_wr_value :
                 // No CSR instruction update, only h/w side-effects.
                          $upd_csr_instret;
         
         
      
         
         
         //--------------
         // CSR INSTRETH
         //--------------
         @0
            $is_csr_instreth = $raw[31:20] == 12'hC82;
         @0
            // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
            // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
            
            
            
            
            // hw_wr_mask conditioned by hw_wr.
            $csr_instreth_hw_wr_en_mask[31:0] = {32{$csr_instreth_hw_wr}} & $csr_instreth_hw_wr_mask;
            // The CSR value, updated by side-effect writes.
            $upd_csr_instreth[31:0] =
                 ($csr_instreth_hw_wr_en_mask & $csr_instreth_hw_wr_value) | (~ $csr_instreth_hw_wr_en_mask & $csr_instreth);
         
         
            
            
            // Next value of the CSR.
            $csr_instreth_masked_wr_value[31:0] =
                 $csr_wr_value[31:0] & {32{1'b1}};
            <<1$csr_instreth[31:0] =
                 $reset ? 32'b0 :
                 ! $commit
                        ? $upd_csr_instreth :
                 $is_csr_write && $is_csr_instreth
                        ? $csr_instreth_masked_wr_value | ($upd_csr_instreth & ~ {32{1'b1}}) :
                 $is_csr_set   && $is_csr_instreth
                        ? $upd_csr_instreth |   $csr_instreth_masked_wr_value :
                 $is_csr_clear && $is_csr_instreth
                        ? $upd_csr_instreth & ~ $csr_instreth_masked_wr_value :
                 // No CSR instruction update, only h/w side-effects.
                          $upd_csr_instreth;
         
         
      
         
      
         @0
            
            
            
            // CSR write value for CSR write instructions.
            $csr_wr_value[31:0] = $raw_funct3[2] ? {27'b0, $raw_rs1} : /src[1]$reg_value;
         
         
         
            // Counter CSR
            //
            
            
            // Count within time unit. This is not reset on writes to time CSR, so time CSR is only accurate to time unit.
            $RemainingCyclesWithinTimeUnit[30-1:0] <=
                 ($reset || $time_unit_expires) ?
                        30'd999999999 :
                        $RemainingCyclesWithinTimeUnit - 30'b1;
            $time_unit_expires = !( | $RemainingCyclesWithinTimeUnit);  // reaches zero
                  
            $full_csr_cycle_hw_wr_value[63:0]   = {$csr_cycleh,   $csr_cycle  } + 64'b1;
            $full_csr_time_hw_wr_value[63:0]    = {$csr_timeh,    $csr_time   } + 64'b1;
            $full_csr_instret_hw_wr_value[63:0] = {$csr_instreth, $csr_instret} + 64'b1;
            
            
         
            // CSR h/w side-effect write signals.
            $csr_cycle_hw_wr = 1'b1;
            $csr_cycle_hw_wr_mask[31:0] = {32{1'b1}};
            $csr_cycle_hw_wr_value[31:0] = $full_csr_cycle_hw_wr_value[31:0];
            $csr_cycleh_hw_wr = 1'b1;
            $csr_cycleh_hw_wr_mask[31:0] = {32{1'b1}};
            $csr_cycleh_hw_wr_value[31:0] = $full_csr_cycle_hw_wr_value[63:32];
            $csr_time_hw_wr = $time_unit_expires;
            $csr_time_hw_wr_mask[31:0] = {32{1'b1}};
            $csr_time_hw_wr_value[31:0] = $full_csr_time_hw_wr_value[31:0];
            $csr_timeh_hw_wr = $time_unit_expires;
            $csr_timeh_hw_wr_mask[31:0] = {32{1'b1}};
            $csr_timeh_hw_wr_value[31:0] = $full_csr_time_hw_wr_value[63:32];
            $csr_instret_hw_wr = $commit;
            $csr_instret_hw_wr_mask[31:0] = {32{1'b1}};
            $csr_instret_hw_wr_value[31:0] = $full_csr_instret_hw_wr_value[31:0];
            $csr_instreth_hw_wr = $commit;
            $csr_instreth_hw_wr_mask[31:0] = {32{1'b1}};
            $csr_instreth_hw_wr_value[31:0] = $full_csr_instret_hw_wr_value[63:32];
            
            
         
         
         
            
            // For multicore CSRs:
            
            
         
         
            
            // Memory inputs.
            ?$valid_exe
               $unnatural_addr_trap = ($ld_st_word && ($addr[1:0] != 2'b00)) || ($ld_st_half && $addr[0]);
            $ld_st_cond = $ld_st && $valid_exe;
            ?$ld_st_cond
               $addr[31:0] = /src[1]$reg_value + ($ld ? $raw_i_imm : $raw_s_imm);
               
               // Hardware assumes natural alignment. Otherwise, trap, and handle in s/w (though no s/w provided).
            $st_cond = $st && $valid_exe;
            ?$st_cond
               // Provide a value to store, naturally-aligned to memory, that will work regardless of the lower $addr bits.
               $st_reg_value[31:0] = 
                                                        /src[2]$reg_value;
               $st_value[31:0] =
                    $ld_st_word ? $st_reg_value :            // word
                    $ld_st_half ? {2{$st_reg_value[15:0]}} : // half
                                  {4{$st_reg_value[7:0]}};   // byte
               $st_mask[3:0] =
                    $ld_st_word ? 4'hf :                     // word
                    $ld_st_half ? ($addr[1] ? 4'hc : 4'h3) : // half
                                  (4'h1 << $addr[1:0]);      // byte
      
            // Swizzle bytes for load result (assuming natural alignment) and pass to /orig_load_inst scope
            ?$second_issue_ld
               /orig_load_inst
                  $spec_ld_cond = $spec_ld;
                  ?$spec_ld_cond
                     // (Verilator didn't like indexing $ld_value by signal math, so we do these the long way.)
                     $sign_bit =
                        ! $raw_funct3[2] && (  // Signed && ...
                           $ld_st_word ? $ld_value[31] :
                           $ld_st_half ? ($addr[1] ? $ld_value[31] : $ld_value[15]) :
                                         (($addr[1:0] == 2'b00) ? $ld_value[7] :
                                          ($addr[1:0] == 2'b01) ? $ld_value[15] :
                                          ($addr[1:0] == 2'b10) ? $ld_value[23] :
                                                                  $ld_value[31]
                                         )
                        );
                     {$ld_rslt[31:0], $ld_mask[3:0]} =
                          $ld_st_word ? {$ld_value, 4'b1111} :
                          $ld_st_half ? {{16{$sign_bit}}, $addr[1] ? {$ld_value[31:16], 4'b1100} :
                                                                     {$ld_value[15:0] , 4'b0011}} :
                                        {{24{$sign_bit}}, ($addr[1:0] == 2'b00) ? {$ld_value[7:0]  , 4'b0001} :
                                                          ($addr[1:0] == 2'b01) ? {$ld_value[15:8] , 4'b0010} :
                                                          ($addr[1:0] == 2'b10) ? {$ld_value[23:16], 4'b0100} :
                                                                                  {$ld_value[31:24], 4'b1000}};
                     `BOGUS_USE($ld_mask) // It's only for formal verification.
            // ISA-specific trap conditions:
            // I can't see in the spec which of these is to commit results. I've made choices that make riscv-formal happy.
            $non_aborting_isa_trap = ($branch && $taken && $misaligned_pc) ||
                                     ($jump && $misaligned_jump_target) ||
                                     ($indirect_jump && $misaligned_indirect_jump_target);
            $aborting_isa_trap =     ($ld_st && $unnatural_addr_trap) ||
                                     $csr_trap;
            
         @0
            // Mux the correct result.
            
            // in case of second issue, the results are pulled out of the /orig_inst or /load_inst scope. 
            // no alignment is needed as the rslt mux and the long latency results both appear in the same pipestage.
         
            // in the case of second isssue for multiplication with ALTOPS enabled (or running formal checks for M extension), 
            // the module gives out the result in two cycles but we explicitly flop the $mul_rslt 
            // (by alignment with 3+NON_PIPELINED_BUBBLES to augment the 5 cycle behavior of the mul operation)
         
            $rslt[31:0] =
                  $second_issue_ld ? /orig_load_inst$ld_rslt : 
                  ($second_issue_div_mul && |fetch/instr>>1$stall_cnt_upper_div) ? |fetch/instr$divblock_rslt : 
                  ($second_issue_div_mul && |fetch/instr>>1$stall_cnt_upper_mul) ? |fetch/instr$mulblock_rslt :
                   
                  
                   
                  
                  
                  
                  32'b0 |
                ({32{$is_lui_instr}} & $lui_rslt) |
                ({32{$is_auipc_instr}} & $auipc_rslt) |
                ({32{$is_jal_instr}} & $jal_rslt) |
                ({32{$is_jalr_instr}} & $jalr_rslt) |
                ({32{$is_lb_instr}} & $lb_rslt) |
                ({32{$is_lh_instr}} & $lh_rslt) |
                ({32{$is_lw_instr}} & $lw_rslt) |
                ({32{$is_lbu_instr}} & $lbu_rslt) |
                ({32{$is_lhu_instr}} & $lhu_rslt) |
                ({32{$is_addi_instr}} & $addi_rslt) |
                ({32{$is_slti_instr}} & $slti_rslt) |
                ({32{$is_sltiu_instr}} & $sltiu_rslt) |
                ({32{$is_xori_instr}} & $xori_rslt) |
                ({32{$is_ori_instr}} & $ori_rslt) |
                ({32{$is_andi_instr}} & $andi_rslt) |
                ({32{$is_slli_instr}} & $slli_rslt) |
                ({32{$is_srli_instr}} & $srli_rslt) |
                ({32{$is_srai_instr}} & $srai_rslt) |
                ({32{$is_add_instr}} & $add_rslt) |
                ({32{$is_sub_instr}} & $sub_rslt) |
                ({32{$is_sll_instr}} & $sll_rslt) |
                ({32{$is_slt_instr}} & $slt_rslt) |
                ({32{$is_sltu_instr}} & $sltu_rslt) |
                ({32{$is_xor_instr}} & $xor_rslt) |
                ({32{$is_srl_instr}} & $srl_rslt) |
                ({32{$is_sra_instr}} & $sra_rslt) |
                ({32{$is_or_instr}} & $or_rslt) |
                ({32{$is_and_instr}} & $and_rslt) |
                ({32{$is_csrrw_instr}} & $csrrw_rslt) |
                ({32{$is_csrrs_instr}} & $csrrs_rslt) |
                ({32{$is_csrrc_instr}} & $csrrc_rslt) |
                ({32{$is_csrrwi_instr}} & $csrrwi_rslt) |
                ({32{$is_csrrsi_instr}} & $csrrsi_rslt) |
                ({32{$is_csrrci_instr}} & $csrrci_rslt) |
                ({32{$is_mul_instr}} & $mul_rslt) |
                ({32{$is_mulh_instr}} & $mulh_rslt) |
                ({32{$is_mulhsu_instr}} & $mulhsu_rslt) |
                ({32{$is_mulhu_instr}} & $mulhu_rslt) |
                ({32{$is_div_instr}} & $div_rslt) |
                ({32{$is_divu_instr}} & $divu_rslt) |
                ({32{$is_rem_instr}} & $rem_rslt) |
                ({32{$is_remu_instr}} & $remu_rslt);
            
         
      
         
         @0
            
         @0
            // =======
            // Control
            // =======
            
            // A version of PC we can pull through $ANYs.
            $pc[31:2] = $Pc[31:2];
            `BOGUS_USE($pc)
            
            
            // Execute stage redirect conditions.
            $non_pipelined = $div_mul  ;
            $replay_trap = 1'b0;
            $aborting_trap = ($replay_trap || ($valid_decode && $illegal) || $aborting_isa_trap);
            $non_aborting_trap = $non_aborting_isa_trap;
            $mispred_branch = $branch && ! ($conditional_branch && ($taken == $pred_taken));
            ?$valid_decode_branch
               $branch_redir_pc[31:2] =
                  // If fallthrough predictor, branch mispred always redirects taken, otherwise PC+1 for not-taken.
                  
                  $branch_target;
            $trap_target[31:2] = $replay_trap ? $Pc : {30{1'b1}};  // TODO: What should this be? Using ones to terminate test for now.
            
            // Determine whether the instruction should commit it's result.
            //
            // Abort: Instruction triggers a condition causing a no-commit.
            // Commit: Ultimate decision to commit results of this instruction, considering aborts and
            //         prior-instruction redirects (good-path)
            //
            // Treatment of loads:
            //    Loads will commit. They write a garbage value and "pending" to the register file.
            //    Returning loads clobber an instruction. This instruction is $abort'ed (as is the
            //    returning load, since they are one in the same). Returning load must explicitly
            //    write results.
            //
            
            $abort = 1'b0 || $second_issue || $NoFetch || $replay || $aborting_trap;  // Note that register bypass logic requires that abort conditions also redirect.
            // $commit = m5_prev_instr_valid_through(m5_MAX_REDIRECT_BUBBLES + 1), where +1 accounts for this
            // instruction's redirects. However, to meet timing, we consider this instruction separately, so,
            // commit if valid as of the latest redirect from prior instructions and not abort of this instruction.
            
            // Normal case:
            $good_path = (! $reset && >>0$next_good_path_mask[1]);
            $commit = $good_path && ! $abort;
            
            
            
            
            
            
            // Conditions that commit results.
            $valid_dest_reg_valid = ($dest_reg_valid && $commit) || ($second_issue  );
            
            
               
            
            $valid_ld = $ld && $commit;
            $valid_st = $st && $commit;
   
   // This macro assumes little-endian.
   
   |fetch
      /instr
         // ====
         // Load
         // ====
         @0
            /* DMEM_STYLE: ARRAY */
            
            
            
            
            // Array. Required for VIZ.
            /bank[3:0]
               $ANY = /instr$ANY; // Find signal from outside of /bank.
               /mem[31:0]
               ?$spec_ld
                  $ld_data[(32 / 4) - 1 : 0] = /mem[$addr[4 + 2 : 2]]$Value;
         
               // Array writes are not currently permitted to use assignment
               // syntax, so \always_comb is used, and this must be outside of
               // when conditions, so we need to use if. <<1 because no <= support
               // in this context. (This limitation will be lifted.)
         
               // =====
               // Store
               // =====
         
               \SV_plus
                  always @ (posedge clk) begin
                     if ($valid_st && $st_mask[#bank])
                        /mem[$addr[4 + 2 : 2]]<<0$$^Value[(32 / 4) - 1 : 0] <= $st_value[(#bank + 1) * (32 / 4) - 1: #bank * (32 / 4)];
                  end
            // Combine $ld_data per bank, assuming little-endian.
            //$ld_data[m5_WORD_RANGE] = /bank[*]$ld_data;
            // Unfortunately formal verification tools can't handle multiple packed dimensions produced by the expression above, so we
            // build the concatination.
            $ld_data[31:0] = {/bank[3]$ld_data, /bank[2]$ld_data, /bank[1]$ld_data, /bank[0]$ld_data};
         
         
         
         
   // Return loads in |mem pipeline. We just hook up the |mem pipeline to the |fetch pipeline w/ the
   // right alignment.
   |mem
      /data
         // This becomes a one-liner once $ANY acts on subscopes.
         @0
            $ANY = /top|fetch/instr>>0$ANY;
            /src[2:1]
               $ANY = /top|fetch/instr/src>>0$ANY;
            
            
         
         // For consistency with other memories, assign $ld_value in @m5_MEM_WR_STAGE+1. 
         @1
            $ld_value[31:0] = /top|fetch/instr>>0$ld_data;
   |fetch
      /instr
         // =========
         // Reg Write
         // =========
         
         /* verilator lint_save */
         /* verilator lint_on WIDTH */
         @0
            
            
            // Reg Write (Floating Point Register)
            \SV_plus
               always @ (posedge clk) begin
                  if (/instr$valid_dest_reg_valid)
                     /regs[/instr$dest_reg]<<0$$^value[31:0] <= /instr$rslt;
               end
         
         
            
            
            // Write $pending along with $value, but coded differently because it must be reset.
            /regs[31:1]
               <<1$pending = ! /instr$reset && (((#regs == /instr$dest_reg) && /instr$valid_dest_reg_valid) ? /instr$reg_wr_pending : $pending);
         
         
         /* verilator lint_restore */
      
         // ======
         // FPU RF
         // ======
         
         
      
         @0
            `BOGUS_USE(/orig_inst/src[2]$dummy) // To pull $dummy through $ANY expressions, avoiding empty expressions.
         // TODO. Seperate the $rslt and $reg_wr_pending committed to both "int" and "fpu" regs.
   
   
   
   
   
   
   
   
   
   /* CPU_VIZ HERE */
   
   
   
   
   
   // Code that supports 
   |fetch
      @0
         /instr
            // A type-independent immediate value, for debug. (For R-type, funct7 is used as immediate).
            $imm_value[31:0] =
                 ({32{$is_i_type}} & $raw_i_imm) |
                 ({32{$is_r_type}} & {25'b0, $raw_funct7}) |
                 ({32{$is_s_type}} & $raw_s_imm) |
                 ({32{$is_b_type}} & $raw_b_imm) |
                 ({32{$is_u_type}} & $raw_u_imm) |
                 ({32{$is_j_type}} & $raw_j_imm);
            $imm_valid = $is_i_type || $is_r_type || $is_s_type || $is_b_type || $is_u_type || $is_j_type;
   |fetch
      @0
         
         \viz_js
            //Main layout
            box: {
                  fill: "#7AD7F0",
                  strokeWidth: 0
                 },
            where: {left: 0, top: 0, width: 451, height: 251},
               
      
         
         
         /instr_mem[15:0]
            \viz_js
                all: {
                  box: {
                     width: 670,
                     height: 76 + 18 * 16,
                     fill: "#208028",
                     stroke: "white",
                     strokeWidth: 0
                  },
                  init() {
                     let imem_header = new fabric.Text("🗃️ Instr. Memory", {
                        top: 10,
                        left: 250,
                        fontSize: 20,
                        fontWeight: 800,
                        fontFamily: "monospace",
                        fill: "black"
                     })
                     return {imem_header}
                  },
                  render() {
                     // Highlight instruction.
                     let pc = '|fetch/instr$pc'.asInt(-1)
                      this.highlighted_addr = pc
                      instance = this.getContext().children[pc]
                      if (typeof instance !== "undefined") {
                         let color = '|fetch/instr$commit'.asBool(false) ? "#b0ffff" : "#d0d0d0"
                         instance.initObjects.instr_binary_box.set({fill: color})
                         instance.initObjects.instr_asm_box.set({fill: color})
                      }
                      // Highlight 2nd issue instruction.
                      let pc2 = '|fetch/instr/orig_inst$pc'.asInt(-1)
                      this.highlighted_addr2 = pc2
                      instance2 = this.getContext().children[pc2]
                      if ('|fetch/instr$second_issue'.asBool(false) && typeof instance2 !== "undefined") {
                         let color = "#ffd0b0"
                         instance2.initObjects.instr_binary_box.set({fill: color})
                         instance2.initObjects.instr_asm_box.set({fill: color})
                      }
                  },
                  unrender() {
                     //debbuger
                     // Unhighlight instruction.
                     let instance = this.getContext().children[this.highlighted_addr]
                      if (typeof instance != "undefined") {
                         instance.initObjects.instr_binary_box.set({fill: "white"})
                         instance.initObjects.instr_asm_box.set({fill: "white"})
                      }
                      // Unhighlight 2nd issue instruction.
                      let instance2 = this.getContext().children[this.highlighted_addr2]
                      if (typeof instance2 != "undefined") {
                         instance2.initObjects.instr_binary_box.set({fill: "white"})
                         instance2.initObjects.instr_asm_box.set({fill: "white"})
                      }
                  },
                },
                box: {strokeWidth: 0},
                where: {left: 10, top: 10},
                where0: {left: 30, top: 50},
                layout: {top: 18}, //scope's instance stacked vertically
                init() {
                  let instr_str = new fabric.Text("" , {
                     left: 10,
                     fontSize: 14,
                     fontFamily: "monospace"
                  })
                  let instr_asm_box = new fabric.Rect({
                     left: 0,
                     fill: "white",
                     width: 280,
                     height: 14
                  })
                  let instr_binary_box = new fabric.Rect({
                     left: 330,
                     fill: "white",
                     width: 280,
                     height: 14
                  })
                  return {instr_asm_box, instr_binary_box, instr_str}
                },
                
                render() {
                   // Instruction memory is constant, so just create it once.
                  
                     
                  
                     let instr_str = '$instr'.asBinaryStr(NaN) + "      " + '$instr_str'.asString("?")
                  
                     
                  
                     
                  
                  this.getObjects().instr_str.set({text: `${instr_str}`})
                },
                
                
         
      
            
         /instr
            
            ?$valid_decode
               // For debug.
               $mnemonic[10*8-1:0] = $is_lui_instr ? "LUI       " : $is_auipc_instr ? "AUIPC     " : $is_jal_instr ? "JAL       " : $is_jalr_instr ? "JALR      " : $is_beq_instr ? "BEQ       " : $is_bne_instr ? "BNE       " : $is_blt_instr ? "BLT       " : $is_bge_instr ? "BGE       " : $is_bltu_instr ? "BLTU      " : $is_bgeu_instr ? "BGEU      " : $is_lb_instr ? "LB        " : $is_lh_instr ? "LH        " : $is_lw_instr ? "LW        " : $is_lbu_instr ? "LBU       " : $is_lhu_instr ? "LHU       " : $is_sb_instr ? "SB        " : $is_sh_instr ? "SH        " : $is_sw_instr ? "SW        " : $is_addi_instr ? "ADDI      " : $is_slti_instr ? "SLTI      " : $is_sltiu_instr ? "SLTIU     " : $is_xori_instr ? "XORI      " : $is_ori_instr ? "ORI       " : $is_andi_instr ? "ANDI      " : $is_slli_instr ? "SLLI      " : $is_srli_instr ? "SRLI      " : $is_srai_instr ? "SRAI      " : $is_add_instr ? "ADD       " : $is_sub_instr ? "SUB       " : $is_sll_instr ? "SLL       " : $is_slt_instr ? "SLT       " : $is_sltu_instr ? "SLTU      " : $is_xor_instr ? "XOR       " : $is_srl_instr ? "SRL       " : $is_sra_instr ? "SRA       " : $is_or_instr ? "OR        " : $is_and_instr ? "AND       " : $is_csrrw_instr ? "CSRRW     " : $is_csrrs_instr ? "CSRRS     " : $is_csrrc_instr ? "CSRRC     " : $is_csrrwi_instr ? "CSRRWI    " : $is_csrrsi_instr ? "CSRRSI    " : $is_csrrci_instr ? "CSRRCI    " : $is_mul_instr ? "MUL       " : $is_mulh_instr ? "MULH      " : $is_mulhsu_instr ? "MULHSU    " : $is_mulhu_instr ? "MULHU     " : $is_div_instr ? "DIV       " : $is_divu_instr ? "DIVU      " : $is_rem_instr ? "REM       " : $is_remu_instr ? "REMU      " :  "ILLEGAL   ";
               `BOGUS_USE($mnemonic)
            \viz_js
               box: {left: 0, top: 0,
                  strokeWidth: 0
               },
               init() {
                  //debugger
                  let decode_header = new fabric.Text("⚙️ Instruction", {
                     top: 15,
                     left: 103 + 605 + 20 -6,
                     fill: "maroon",
                     fontSize: 18,
                     fontWeight: 800,
                     fontFamily: "monospace"
                  })
                  let decode_box = new fabric.Rect({
                     top: 10,
                     left: 103 + 605 -6,
                     fill: "#f8f0e8",
                     width: 230,
                     height: 160,
                     stroke: "#ff8060"
                  })
                  return {decode_box, decode_header}
               },
               where: {left: 10, top: 0},
               render() {
                  //debugger
                  objects = {}
                  //
                  // PC instr_mem pointer
                  //
                  let pc = '$Pc'.asInt(-1)
                  let commit = '$commit'.asBool(false)
                  let color = !commit                ? "gray" :
                                                       "blue"
                  objects.pc_pointer = new fabric.Text("👉", {
                     top: 60 + 18 * pc,
                     left: 335,
                     fill: color,
                     fontSize: 14,
                     fontFamily: "monospace",
                     opacity: commit ? 1 : 0.5
                  })
                  if ('$second_issue'.asBool(false)) {
                     let second_issue_pc = '/orig_inst$pc'.asInt(-1)
                     objects.second_issue_pointer = new fabric.Text("👉🏿", {
                        top: 60 + 18 * pc,
                        left: 335,
                        fill: color,
                        fontSize: 14,
                        fontFamily: "monospace",
                        opacity: 0.75
                     })
                  }
                  //
                  //
                  // Fetch Instruction
                  //
                  // TODO: indexing only works in direct lineage.  let fetchInstr = new fabric.Text('|fetch/instr_mem[$Pc]$instr'.asString(), {...})  // TODO: make indexing recursive.
                  //let fetchInstr = new fabric.Text('$raw'.asString("--"), {
                  //   top: 50,
                  //   left: 90,
                  //   fill: color,
                  //   fontSize: 14,
                  //   fontFamily: "monospace"
                  //})
                  
                  //
                  // Instruction with values.
                  //
                  
                     
                     
                     
                     
                     
                     
                     
                  
                     let regStr = (type_char, valid, regNum, regValue) => {
                        return type_char + (valid ? `${regNum} (${regValue})` : `X`)
                     }
                     let srcStr = (src) => {
                        let ret = ""
                        if ((src < 3) &&
                            '/src[src]$unconditioned_is_reg'.asBool(false)) {
                           ret += `\n      ${regStr("x", true, '/src[src]$unconditioned_reg'.asInt(NaN),     '/src[src]$unconditioned_reg_value'.asInt(NaN))}`
                        }
                        
                        
                           
                        
                        
                        return ret
                     }
                     let dest_reg_valid = '$dest_reg_valid'.asBool(false)
                     let str = `${regStr("x", dest_reg_valid, '$raw_rd'.asInt(NaN), '$rslt'.asInt(NaN))}\n`
                     
                     
                     
                        
                     
                     
                     str += `  = ${'$mnemonic'.asString("?")}${srcStr(1)}${srcStr(2)}${srcStr(3)}`
                     if ('$imm_valid'.asBool()) {
                        str += `\n      i[${'$imm_value'.asInt(NaN)}]`
                     }
                  
                     
                     
                        
                     
                     
                        
                                   
                                   
                     
                     
                               
                               
                  
                  
                  // srcX Arrow function
                  newSrcArrow = function(name, fp, addr, valid, pos) {
                     if (valid) {
                        objects[name + "_arrow"] = new fabric.Line([965 + (fp ? 0 : 0), 17 * addr + 96, 830, 96 + 18 * pos], {
                           stroke: "#b0c8df",
                           strokeWidth: 2
                        })
                     }
                  }
                  objects.pc_arrow = new fabric.Line([10+620, 18 * pc + 66, 86+620, -8+66], {
                     stroke: "#b0c8df",
                     strokeWidth: 2
                  })
                  // Create rsX arrows for int and FP regs.
                  let reg_addr1 = '$raw_rs1'.asInt()
                  let reg_addr2 = '$raw_rs2'.asInt()
                  let reg_addr3 = '$raw_rs3'.asInt()
                  let rs1_valid = '/src[1]$unconditioned_is_reg'.asBool()
                  let rs2_valid = '/src[2]$unconditioned_is_reg'.asBool()
                  let rs3_valid = false
                  let fpu_rs1_valid = false
                  let fpu_rs2_valid = false
                  let fpu_rs3_valid = false
                  newSrcArrow("rs1", false, reg_addr1, rs1_valid, 1)
                  newSrcArrow("rs2", false, reg_addr2, rs2_valid, 2)
                  let src1_value = '/src[1]$unconditioned_reg_value'.asInt()
                  let src2_value = '/src[2]$unconditioned_reg_value'.asInt()
                  let src3_value = 0
                  let dest_reg = '$dest_reg'.asInt(0)
                  let valid_dest_reg_valid = '$valid_dest_reg_valid'.asBool(false)
                  let valid_dest_fpu_reg_valid = false
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  let the_dest_reg = valid_dest_fpu_reg_valid ? dest_fpu_reg : dest_reg
                  // rd Arrow
                  let second_issue = '$second_issue'.asBool()
                  objects.rd_arrow = new fabric.Line([780, 76, (valid_dest_fpu_reg_valid ? 965 + 0 : 965), 17 * the_dest_reg + 96], {
                     stroke: '$second_issue'.asBool() ? "#c03050" : commit ? "#a0dfff" : "#d0d0d0",
                     strokeWidth: 3,
                     visible: valid_dest_reg_valid || valid_dest_fpu_reg_valid
                  })
                  // load arrow
                  let ld_st_addr = ('$addr'.asInt() / 4)
                  let ld_valid = '$valid_ld'.asBool(false)
                  objects.ld_arrow = new fabric.Line([1165 + 0, (17 * ld_st_addr) + 96, 1105 + (valid_dest_fpu_reg_valid ? 0 : 0), 96 + 17 * the_dest_reg], {
                     stroke: "#c03050",
                     strokeWidth: 3,
                     visible: ld_valid
                  })
                  // store arrow
                  let st_valid = '$valid_st'.asBool()
                  objects.st_arrow = new fabric.Line(
                     [830, 132, 1165 + 0, 17 * ld_st_addr + 96], {
                     stroke: "#a0dfff",
                     strokeWidth: 3,
                     visible: st_valid
                  })
                  
                  //
                  let $instr_str = '|fetch/instr_mem[pc]$instr_str'  // pc could be invalid, so make sure this isn't null.
                  let instr_string = $instr_str ? $instr_str.asString("?") : "?"
                  objects.fetch_instr_viz = new fabric.Text(instr_string, {
                           top: 18 * pc + 60,
                           left: 361,
                           fill: color,
                           fontSize: 14,
                           fontFamily: "monospace"
                  })
                  //
                  objects.fetch_instr_viz.animate({top: 50, left: 710}, {
                       onChange: this.global.canvas.renderAll.bind(this.global.canvas),
                       duration: 500
                  })
                  
                  //
                  objects.instr_with_values = new fabric.Text(str, {
                     top: 70,
                     left: 730,
                     fill: color,
                     fontSize: 14,
                     fontFamily: "monospace"
                  })
                  //
                  objects.src1_value_viz = new fabric.Text(src1_value.toString(), {
                     fill: color,
                     fontSize: 14,
                     fontFamily: "monospace",
                     fontWeight: 800,
                     visible: false
                  })
                  if (rs1_valid || fpu_rs1_valid) {
                     setTimeout(() => {
                        objects.src1_value_viz.set({left: 965 + (rs1_valid ? 0 : 0),
                                                    top: 17 * reg_addr1 + 96,
                                                    visible: true})
                        objects.src1_value_viz.animate({left: 830, top: 17 * 1 + 90}, {
                             onChange: this.global.canvas.renderAll.bind(this.global.canvas),
                             duration: 500
                        })
                        setTimeout(() => {
                           objects.src1_value_viz.set({visible: false})
                           this.global.canvas.renderAll.bind(this.global.canvas)()
                        }, 500)
                     }, 500)
                  }
                  objects.src2_value_viz = new fabric.Text(src2_value.toString(), {
                     fill: color,
                     fontSize: 14,
                     fontFamily: "monospace",
                     fontWeight: 800,
                     visible: false
                  })
                  let src2_being_stored = '$valid_decode'.asBool(false) && '$st'.asBool(false) && commit; // Animate src2 value being stored.
                  if (rs2_valid || fpu_rs2_valid) {
                        setTimeout(() => {
                        objects.src2_value_viz.set({left: 965 + (rs2_valid ? 0 : 0),
                                                    top: 17 * reg_addr2 + 96,
                                                    visible: true})
                        objects.src2_value_viz.set({visible: true})
                        objects.src2_value_viz.animate({left: 830, top: 17 * 2 + 90}, {
                             onChange: this.global.canvas.renderAll.bind(this.global.canvas),
                             duration: 500
                        })
                        setTimeout(() => {
                           if (src2_being_stored) {
                              // Animate src2 value being stored.
                              objects.src2_value_viz.animate({left: 1165 + 0, top: 17 * ld_st_addr + 96}, {
                                 onChange: this.global.canvas.renderAll.bind(this.global.canvas),
                                 duration: 500
                              })
                              setTimeout(() => {
                                 objects.src2_value_viz.set({visible: false})
                                 this.global.canvas.renderAll.bind(this.global.canvas)()
                              }, 500)
                           } else {
                              // Hide src2 value.
                              objects.src2_value_viz.set({visible: false})
                              this.global.canvas.renderAll.bind(this.global.canvas)()
                           }
                        }, 500)
                     }, 500)
                  }
                  objects.src3_value_viz = new fabric.Text(src3_value.toString(), {
                     fill: color,
                     fontSize: 14,
                     fontFamily: "monospace",
                     fontWeight: 800,
                     visible: false
                  })
                  if (fpu_rs3_valid) {
                     setTimeout(() => {
                        objects.src3_value_viz.set({left: 965 + (rs3_valid ? 0 : 0),
                                                    top: 17 * reg_addr + 96,
                                                    visible: true})
                        objects.src3_value_viz.animate({left: 830, top: 17 * 3 + 90}, {
                             onChange: this.global.canvas.renderAll.bind(this.global.canvas),
                             duration: 500
                        })
                        setTimeout(() => {
                           objects.src3_value_viz.set({visible: false})
                           this.global.canvas.renderAll.bind(this.global.canvas)()
                        }, 500)
                     }, 500)
                  }
                  let res_value = '$rslt'.asInt().toString(16)
                  objects.result_viz = new fabric.Text(res_value, {
                     top: 76,
                     left: 780,
                     fill: color,
                     fontSize: 14,
                     fontFamily: "monospace",
                     fontWeight: 800,
                     visible: false
                  })
                  if ((valid_dest_reg_valid || valid_dest_fpu_reg_valid) && commit) {
                     setTimeout(() => {
                        objects.result_viz.set({visible: true})
                        objects.result_viz.animate({left: (valid_dest_fpu_reg_valid ? 965 + 0 : 965), top: 17 * dest_reg + 90}, {
                          onChange: this.global.canvas.renderAll.bind(this.global.canvas),
                          duration: 500
                        })
                        setTimeout(() => {
                           objects.result_viz.set({visible: false})
                           this.global.canvas.renderAll.bind(this.global.canvas)()
                        }, 500)
                     }, 1000)
                  }
                  return Object.values(objects)
               }
            
         
            
            // /regs or /fpu_regs
            /src[*]
               // There is an issue (#406) with \viz code indexing causing signals to be packed, and if a packed value
               // has different fields on different clocks, Verilator throws warnings.
               // These are unconditioned versions of the problematic signals.
               $unconditioned_reg[4:0] = $reg;
               $unconditioned_is_reg = $is_reg;
               $unconditioned_reg_value[31:0] = $reg_value;
            
            /regs[31:1]
               \viz_js
                  all: {
                     box: {
                        fill: "#2028b0",
                        width: 170,
                        height: 650,
                        stroke: "black",
                        strokeWidth: 0
                     },
                     init() {
                        let rf_header = new fabric.Text("📂 Int RF", {
                           top: 10,
                           left: 10,
                           fontSize: 18,
                           fontWeight: 800,
                           fontFamily: "monospace",
                           fill: "white"
                        })
                        let rf_header2 = new fabric.Text("Integer (hex)", {
                           top: 40,
                           left: 20,
                           fontSize: 14,
                           fontFamily: "monospace",
                           fill: "white"
                        })
                        this.abi_x_map = ["zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6", ];
                        return {rf_header, rf_header2}
                     },
                  },
                  where: {left: 350 + 605, top: 10},
                  where0: {left: 10, top: 80},
                  box: {
                        fill: "white",
                        width: 150,
                        height: 14,
                        strokeWidth: 0
                     },
                  layout: {top: 17}, //vertically
                  init() {
                     let reg = new fabric.Text("", {
                        left: 10,
                        fontSize: 14,
                        fontFamily: "monospace"
                     })
                     return {reg}
                  },
                  render() {
                     // TODO: This is inefficient as is the same for every entry.
                     let mod = '/instr$valid_dest_reg_valid'.asBool(false) && ('/instr$dest_reg'.asInt(-1) == this.getIndex())
                     let rs_valid = []
                     let read_valid = false
                     for (let i = 1; i <= 2; i++) {
                        rs_valid[i] = '/instr/src[i]$unconditioned_is_reg'.asBool(false) && this.getIndex() === '/instr/src[i]$unconditioned_reg'.asInt(-1)
                        read_valid |= rs_valid[i]
                     }
                     let pending = '<<1$pending'.asBool(false)
                     
                     // Construct string for register value (including reg index, ABI name, and previous value).
                     let reg = parseInt(this.getIndex())
                     const maxStrLen = 15
                     let regStr = '$value'.step(1).asInt(NaN).toString(16)
                     if (mod) {
                        regStr = `${'$value'.asInt(NaN).toString(16)}->` + regStr;
                     }
                     let regIdent = ("RISCV" == "MINI") ? String.fromCharCode("a".charCodeAt(0) + reg) : reg.toString().padStart(2, " ")
                     regIdent += "|" + this.getScope("regs").parent.context.abi_x_map[reg] + ":"
                     regStr = regIdent.padEnd(maxStrLen - regStr.length, " ") + regStr
                     if (regStr.length > maxStrLen) {
                        regStr = "…" + regStr.substr(regStr.length - maxStrLen + 1)
                     }
                     // Color the string.
                     this.getObjects().reg.set({text: regStr})
                     this.getObjects().reg.set({fill: pending ? "darkorange" : mod ? "blue" : "black"})
                     this.getBox().set({fill: mod ? ('/instr$second_issue'.asBool(false) ? "#ffd0b0" : "#b0ffff") : read_valid ? "#d0e8ff" : "white"})
                  }
         
            
            /regcsr
               \viz_js
                  box: {
                     fill: "#2028b0",
                     width: 220,
                     height: 18 * 6 + 52,
                     stroke: "black",
                     strokeWidth: 0
                  },
                  where: {left: 103 + 605, top: 190},
                  init() {
                     let csr_header = new fabric.Text("📂 CSRs", {
                           top: 10,
                           left: 10,
                           fill: "white",
                           fontSize: 18,
                           fontWeight: 800,
                           fontFamily: "monospace"
                        })
                     let csr_objs = {}
                     let csr_boxes = {}
                     csr_objs["cycle_box"] = new fabric.Rect({top: 40 + 18 * 0, left: 20, fill: "white", width: 175, height: 14, visible: true}); csr_objs["cycle"] = new fabric.Text("", {top: 40 + 18 * 0, left: 30, fontSize: 14, fontFamily: "monospace"}); csr_objs["cycleh_box"] = new fabric.Rect({top: 40 + 18 * 1, left: 20, fill: "white", width: 175, height: 14, visible: true}); csr_objs["cycleh"] = new fabric.Text("", {top: 40 + 18 * 1, left: 30, fontSize: 14, fontFamily: "monospace"}); csr_objs["time_box"] = new fabric.Rect({top: 40 + 18 * 2, left: 20, fill: "white", width: 175, height: 14, visible: true}); csr_objs["time"] = new fabric.Text("", {top: 40 + 18 * 2, left: 30, fontSize: 14, fontFamily: "monospace"}); csr_objs["timeh_box"] = new fabric.Rect({top: 40 + 18 * 3, left: 20, fill: "white", width: 175, height: 14, visible: true}); csr_objs["timeh"] = new fabric.Text("", {top: 40 + 18 * 3, left: 30, fontSize: 14, fontFamily: "monospace"}); csr_objs["instret_box"] = new fabric.Rect({top: 40 + 18 * 4, left: 20, fill: "white", width: 175, height: 14, visible: true}); csr_objs["instret"] = new fabric.Text("", {top: 40 + 18 * 4, left: 30, fontSize: 14, fontFamily: "monospace"}); csr_objs["instreth_box"] = new fabric.Rect({top: 40 + 18 * 5, left: 20, fill: "white", width: 175, height: 14, visible: true}); csr_objs["instreth"] = new fabric.Text("", {top: 40 + 18 * 5, left: 30, fontSize: 14, fontFamily: "monospace"}); 
                     return {...csr_objs, ...csr_boxes, csr_header}
                  },
                  render() {
                     let old_val_cycle = '/instr$csr_cycle'.asInt(NaN).toString(); let val_cycle = '/instr$csr_cycle'.step(1).asInt(NaN).toString(); let cyclemod = '/instr$csr_cycle_hw_wr'.asBool(false); let cyclename = String("cycle"); let oldValcycle    = cyclemod    ? `(${old_val_cycle})` : ""; this.getInitObject("cycle").set({text: cyclename + ": " + val_cycle + oldValcycle}); this.getInitObject("cycle").set({fill: cyclemod ? "blue" : "black"}); let old_val_cycleh = '/instr$csr_cycleh'.asInt(NaN).toString(); let val_cycleh = '/instr$csr_cycleh'.step(1).asInt(NaN).toString(); let cyclehmod = '/instr$csr_cycleh_hw_wr'.asBool(false); let cyclehname = String("cycleh"); let oldValcycleh    = cyclehmod    ? `(${old_val_cycleh})` : ""; this.getInitObject("cycleh").set({text: cyclehname + ": " + val_cycleh + oldValcycleh}); this.getInitObject("cycleh").set({fill: cyclehmod ? "blue" : "black"}); let old_val_time = '/instr$csr_time'.asInt(NaN).toString(); let val_time = '/instr$csr_time'.step(1).asInt(NaN).toString(); let timemod = '/instr$csr_time_hw_wr'.asBool(false); let timename = String("time"); let oldValtime    = timemod    ? `(${old_val_time})` : ""; this.getInitObject("time").set({text: timename + ": " + val_time + oldValtime}); this.getInitObject("time").set({fill: timemod ? "blue" : "black"}); let old_val_timeh = '/instr$csr_timeh'.asInt(NaN).toString(); let val_timeh = '/instr$csr_timeh'.step(1).asInt(NaN).toString(); let timehmod = '/instr$csr_timeh_hw_wr'.asBool(false); let timehname = String("timeh"); let oldValtimeh    = timehmod    ? `(${old_val_timeh})` : ""; this.getInitObject("timeh").set({text: timehname + ": " + val_timeh + oldValtimeh}); this.getInitObject("timeh").set({fill: timehmod ? "blue" : "black"}); let old_val_instret = '/instr$csr_instret'.asInt(NaN).toString(); let val_instret = '/instr$csr_instret'.step(1).asInt(NaN).toString(); let instretmod = '/instr$csr_instret_hw_wr'.asBool(false); let instretname = String("instret"); let oldValinstret    = instretmod    ? `(${old_val_instret})` : ""; this.getInitObject("instret").set({text: instretname + ": " + val_instret + oldValinstret}); this.getInitObject("instret").set({fill: instretmod ? "blue" : "black"}); let old_val_instreth = '/instr$csr_instreth'.asInt(NaN).toString(); let val_instreth = '/instr$csr_instreth'.step(1).asInt(NaN).toString(); let instrethmod = '/instr$csr_instreth_hw_wr'.asBool(false); let instrethname = String("instreth"); let oldValinstreth    = instrethmod    ? `(${old_val_instreth})` : ""; this.getInitObject("instreth").set({text: instrethname + ": " + val_instreth + oldValinstreth}); this.getInitObject("instreth").set({fill: instrethmod ? "blue" : "black"}); 
                  }
         
            
            $first_issue = $valid_ld || $non_pipelined;
            /pipe_ctrl
               \viz_js
                  box: {width: 110, height: 160, stroke: "green", strokeWidth: 1, fill: "#b0e0b0"},
                  init() {
                     return {title: new fabric.Text("Cycle-Level Behavior", {
                        top: 10,
                        left: 55,
                        originX: "center", originY: "center",
                        fill: "darkgreen",
                        fontSize: 10,
                        fontWeight: 800,
                        fontFamily: "roboto"
                     })}
                  },
                  where: {left: 103 + 605, top: 265 + 18 * 6, width: 220, height: 330}
               /logic_diagram
                  \viz_js
                     box: {left: -5, top: -15, width: 110, height: 80, strokeWidth: 0},
                     init() {
                        ret = {}
                        labels = {}  // virtual pipeline stage name labels, added to ret after stage backgrounds
                        this.makeBullet = (signalName, bulletText, bulletColor) => {
                           return new fabric.Group([
                                new fabric.Circle({
                                     fill: bulletColor, strokeWidth: 0, opacity: 0.8,
                                     originX: "center", originY: "center",
                                     left: 0, top: 0,
                                     radius: 2}),
                                new fabric.Text(bulletText, {
                                     fill: "black",
                                     originX: "center", originY: "center",
                                     left: 0, top: 0,
                                     fontSize: 2, fontWeight: 800, fontFamily: "monospace"})
                           ], {originX: "center", originY: "center"})
                        }
                        
                        this.color = function (stage) {
                           let i = (stage % 6) + 1
                           let ret = `rgb(${i % 8 >= 4 ? 60 :10}, ${i % 4 >= 2 ? 100 : 30}, ${i % 2 >= 1 ? 150 : 90})`
                           return ret
                        }
                        
                        ret.title = new fabric.Text("Pipeline Reference", {
                           top: -5,
                           left: 50,
                           fill: "black",
                           originX: "center", originY: "center",
                           fontSize: 7,
                           fontWeight: 800,
                           fontFamily: "monospace"
                        })
                        
                        let stages = []  // Eg: [0: {virtualStages: ["NEXT_PC", "FETCH"], left: 10, right: 25}, 2: ...}
                        let stageCnt = 0
                        let defineStage = function (name, stage, left, right) {
                           if (!stages[stage]) {
                              stages[stage] = {}
                           }
                           s = stages[stage]
                           s.virtualStages = []
                           if (!s.left || left < s.left) {s.left = left}
                           if (!s.right || right > s.right) {s.right = right}
                           s.virtualStages.push(name)
                           // Create label
                           labels[`${name}_label`] = new fabric.Text(name, {
                                     fill: "white",
                                     originX: "center", originY: "center",
                                     left: (left + right) / 2, top: 57 + ((stageCnt % 2) ? 0 : 3),
                                     fontSize: 2, fontWeight: 800, fontFamily: "roboto"
                           })
                           stageCnt++
                        }
                        defineStage("NEXT_PC", 0 - 0, 8.5, 13); defineStage("FETCH", 0 - 0, 13, 21); defineStage("DECODE", 0 - 0, 21, 33); defineStage("BRANCH_PRED", 0 - 0, 33, 41); defineStage("REG_RD", 0 - 0, 41, 58); defineStage("EXECUTE", 0 - 0, 58, 73.3); defineStage("RESULT", 0 - 0, 73.3, 77.2); defineStage("REG_WR", 0 - 0, 77.2, 93); defineStage("MEM_WR", 0 - 0, 93, 100); 
                        for (stage in stages) {
                           stage = parseInt(stage)
                           s = stages[stage]
                           ret[`stage${stage}`] = new fabric.Rect({
                                left: s.left, top: 0, width: s.right - s.left, height: 62,
                                fill: this.color(stage)
                           })
                           ret[`@${stage}`] = new fabric.Text(`@${stage}`, {
                                fill: "green",
                                originX: "center", originY: "center",
                                left: (s.left + s.right) / 2, top: 64,
                                fontSize: 2, fontWeight: 800, fontFamily: "mono"
                           })
                        }
                        // Layer in stage labels.
                        Object.assign(ret, labels)
                        
                        redirect_cond = (signalName, bulletText, bulletColor, left, top) => {
                           let ret = new fabric.Group([
                                this.makeBullet(signalName, bulletText, bulletColor)
                                     .set({left: left, top: top, width: 4, height: 4}),
                                new fabric.Text(signalName, {
                                     fill: "black",
                                     originY: "center",
                                     left: left + 2, top: top,
                                     fontSize: 2, fontWeight: 800, fontFamily: "monospace"})
                           ])
                           return ret
                        }
                        ret.$second_issue = redirect_cond("$second_issue", "2nd", "orange", 11.8, 26.2); ret.$NoFetch = redirect_cond("$NoFetch", "...", "red", 11.8, 30); ret.$replay = redirect_cond("$replay", "Re", "#ff8000", 50, 29.1); ret.$jump = redirect_cond("$jump", "Jp", "purple", 61, 11); ret.$mispred_branch = redirect_cond("$mispred_branch", "Br", "blue", 70, 20); ret.$indirect_jump = redirect_cond("$indirect_jump", "IJ", "purple", 68, 16); ret.$non_pipelined = redirect_cond("$non_pipelined", "NP", "red", 75.6, 25); ret.$aborting_trap = redirect_cond("$aborting_trap", "AT", "#ff0080", 75.6, 7); ret.$non_aborting_trap = redirect_cond("$non_aborting_trap", "T", "#ff0080", 75.6, 12); 
                        // Add a bullet for 1st-issue instructions.
                        ret.$first_issue = redirect_cond("$first_issue", "1st", "orange", 75, 31.5)
                        ret.diagram =
                           // To update diagram, save from https://docs.google.com/presentation/d/1tFjekV06XHTYOXCSjd3er2kthiPEPaWrXlHKnS0yt5Q/edit?usp=sharing
                           // Open in Inkscape. Delete background rect. Edit > Resize Page to Selection. Drag into GitHub file editor. Copy URL. Cancel edit. Paste here.
                           this.newImageFromURL(
                               "https://raw.githubusercontent.com/stevehoover/warp-v_includes/b4c0b50a17d386259be34b03384803609c625d80/viz/pipeline_diagram.svg",
                               "",
                               {left: 0, top: 0, width: 100, height: 57},
                           )
                        
                        return ret
                     },
                     where: {left: 5, top: 17, width: 100, height: 73},
               /waterfall
                  \viz_js
                     box: {left: 0, top: 0, width: 100, strokeWidth: 0},
                     init() {
                        return {title: new fabric.Text("Waterfall Diagram", {
                           top: 9,
                           left: 50,
                           fill: "black",
                           originX: "center", originY: "center",
                           fontSize: 7,
                           fontWeight: 800,
                           fontFamily: "monospace"
                        })}
                     },
                     where: {left: 5, top: 95, width: 100, height: 70}
                  /pipe_ctrl_instr[2:0]  // Zero on the bottom. See this.getInstrIndex().
                     \viz_js
                        layout: {
                           left: function(i) {return -i * 10},
                           top: function(i) {return -i * 10},
                        },
                        box: {strokeWidth: 0},
                        init() {
                           // /pipe_ctrl_instr indices are chosen such that they render bottom to top
                           // for proper overlapping of dependence arcs.
                           // This function provides indices where
                           // the current instruction has index 0, and negative are above.
                           this.getInstrIndex = () => {
                              return 1 - this.getIndex()
                           }
                           return {instr: new fabric.Text("?", {
                                      left: -100, top: 1,
                                      fill: "darkgray",
                                      fontSize: 7, fontWeight: 800, fontFamily: "monospace",
                                  })}
                        },
                        renderFill() {
                           return (this.getInstrIndex() == 0) ? "#b0ffff" : "transparent"
                        },
                        render() {
                           let instr_text = this.getObjects().instr
                           let step = this.getInstrIndex()
                           try {
                              this.commit = '/instr$commit'      .step(step).asBool(false)
                              this.second = '/instr$second_issue'.step(step).asBool(false)
                              let color =
                                 !this.commit ? "gray" :
                                                "blue"
                              let pc = '/instr$pc'.step(step).asInt()
                              let instr_str = '|fetch/instr_mem[pc]$instr_str'.step(step).asString("<UNKNOWN>")
                              this.getObjects().instr.set({
                                 text: instr_str,
                                 fill: color,
                              })
                           } catch(e) {
                              debugger
                              instr_text.set({text: "<NOT FOUND>", fill: "darkgray"})
                           }
                           return []
                        },
                        where: {left: 4, top: 15, width: 92, height: 51}
                     /pipe_ctrl_stage[1:0]
                        \viz_js
                           box: {width: 10, height: 10, fill: "gray", strokeWidth: 0},
                           layout: "horizontal",
                           init() {
                           },
                           renderFill() {
                              // A step of 0 gives the $GoodPathMask in the middle, running up from bit 0.
                              // Positive steps are to the right (and shifting downward).
                              this.stage = this.getIndex()
                              this.instr = this.getScope("pipe_ctrl_instr").context.getInstrIndex()
                              this.step = this.stage + this.instr  // step amount for $GoodPathMask
                              let second = '/instr$second_issue'.step(this.instr).asBool(false)
                              this.goodPath = true
                              try {
                                 mask = '/instr$GoodPathMask'.step(this.step).asInt(null)
                                 this.goodPath = (mask === null) ? null : ((mask >> this.stage) & 1) != 0
                                 return this.goodPath === null ? "transparent" :
                                        this.goodPath ? this.getScope("pipe_ctrl").children.logic_diagram.context.color(this.getIndex()) :
                                        second        ? "rgb(184,137,57)" :
                                                        "gray"
                              } catch(e) {
                                 return "darkgray"
                              }
                           },
                           render() {
                              let ret = []
                              if (this.goodPath === null) {
                              } else if (this.goodPath) {
                                 let stage = this.stage + 0;  // Absolute stage (not relative to NEXT_PC)
                                 //
                                 // Draw all register bypass arcs from this cell into REG_RD.
                                 //
                                 // TODO: Not implemented for FPU.
                                 if (stage == 0 + 1) {
                                    for (bypassAmount = 1; bypassAmount <= 0; bypassAmount++) {
                                       for (let rs = 1; rs <= 2; rs++) {
                                          try {
                                             let bypassSig = 
                                                             
                                                             
                                                                                                                          null
                                             let rd = '/instr$dest_reg'.step(this.instr).asInt(0)
                                             let bypass = bypassSig.step(bypassAmount + this.instr).asBool(false) &&
                                                          (rd === '/instr/src[rs]$unconditioned_reg'.step(bypassAmount + this.instr).asInt(0))
                                             if (bypass) {
                                                // To coords
                                                let rsLeft = -12 + bypassAmount * 10
                                                let rsTop = -1 + bypassAmount * 10 + 2 * rs
                                                // Line
                                                ret.push(new fabric.Line([-1, 7, -9 + 10 * bypassAmount, rsTop + 1], {
                                                   strokeWidth: 0.5, stroke: "green", opacity: 0.8
                                                }))
                                                // From x#
                                                ret.push(new fabric.Rect({
                                                   left: -4, top: 6, height: 2, width: 5,
                                                   fill: bypass ? "darkgreen" : "gray",
                                                   opacity: 0.8
                                                }))
                                                ret.push(new fabric.Text(`x${rd}`, {
                                                   left: -4, top: 6, height: 2, width: 5,
                                                   fill: "black",
                                                   fontSize: 2,
                                                   fontWeight: 800,
                                                   fontFamily: "monospace"
                                                }))
                                                // To rs#
                                                ret.push(new fabric.Rect({
                                                   left: rsLeft, top: rsTop, height: 2, width: 5,
                                                   fill: bypass ? "green" : "gray",
                                                   opacity: 0.8
                                                }))
                                                ret.push(new fabric.Text(`rs${rs}`, {
                                                   left: rsLeft, top: rsTop, height: 2, width: 5,
                                                   fill: "black",
                                                   fontSize: 2,
                                                   fontWeight: 800,
                                                   fontFamily: "monospace",
                                                   opacity: 0.8
                                                }))
                                             }
                                          } catch(e) {
                                             debugger
                                          }
                                       }
                                    }
                                 }
                                 //
                                 // Draw all redirect arcs from this cell.
                                 //
                                 let redir_cnt = -1   // Increment for every redirect condition.
                                 let render_redir = (sigName, $sig, bulletText, bulletColor, extraBubbleCycle) => {
                                    let step = this.instr
                                    $sig.step(step)
                                    if ($sig.asBool()) {
                                       let ret = []
                                       redir_cnt++
                                       let top = 4 + 2 * redir_cnt
                                       let left = 8 - 8 * extraBubbleCycle
                                       let bullet = this.getScope("pipe_ctrl").children.logic_diagram.context.makeBullet(sigName, bulletText, bulletColor)
                                            .set({left, top})
                                       if (sigName !== "$first_issue") {
                                          ret.push(new fabric.Line(
                                             [left, top, 9.5, 10 * stage + 15],
                                             {strokeWidth: 0.5, stroke: bulletColor}
                                          ))
                                       }
                                       ret.push(bullet)
                                       return ret
                                    } else {
                                       return []
                                    }
                                 }
                                 try {
                                    if (stage == 0) {ret = ret.concat(render_redir("$second_issue", '/instr$second_issue', "2nd", "orange", 0))}; if (stage == 0) {ret = ret.concat(render_redir("$NoFetch", '/instr$NoFetch', "...", "red", 0))}; if (stage == 0) {ret = ret.concat(render_redir("$replay", '/instr$replay', "Re", "#ff8000", 0))}; if (stage == 0) {ret = ret.concat(render_redir("$jump", '/instr$jump', "Jp", "purple", 0))}; if (stage == 0) {ret = ret.concat(render_redir("$mispred_branch", '/instr$mispred_branch', "Br", "blue", 0))}; if (stage == 0) {ret = ret.concat(render_redir("$indirect_jump", '/instr$indirect_jump', "IJ", "purple", 0))}; if (stage == 1) {ret = ret.concat(render_redir("$non_pipelined", '/instr$non_pipelined', "NP", "red", 0))}; if (stage == 1) {ret = ret.concat(render_redir("$aborting_trap", '/instr$aborting_trap', "AT", "#ff0080", 0))}; if (stage == 1) {ret = ret.concat(render_redir("$non_aborting_trap", '/instr$non_aborting_trap', "T", "#ff0080", 0))}; 
                                    // Add case for 1st issue.
                                    if (stage == 1) {
                                       ret = ret.concat(render_redir("$first_issue", '/instr$first_issue', "1st", "orange", 0))
                                    }
                                 } catch(e) {
                                    debugger
                                 }
                              }
                              return ret
                           },
         
            
            
         
            
            
            
            /mem[31:0]
               \viz_js
                  all: {
                     box: {
                        fill: "#208028",
                        width: 190,
                        height: 650,
                        stroke: "black",
                        strokeWidth: 0
                     },
                     init() {
                        let dmem_header = new fabric.Text("🗃️ DMem (hex)", {
                           top: 10,
                           left: 10, // Center aligned
                           fontSize: 20,
                           fontWeight: 800,
                           fontFamily: "monospace",
                           fill: "white"
                        })
                        return {dmem_header}
                     },
                  },
                  where: {left: 10 + (550 + 605) -10 + 0, top: 10},
                  where0: {left: 10, top: 80},
                  box: {
                        fill: "white",
                        width: 40,
                        height: 14,
                        strokeWidth: 0
                     },
                  layout: {top: 17}, //vertically
                  init() {
                     let index =
                        new fabric.Text(parseInt(this.getIndex()).toString() + ":", {
                           left: 10,
                           fontSize: 14,
                           fontFamily: "monospace"
                        })
                     return {index}
                  }
            /bank[3:0] 
               \viz_js
                  box: {strokeWidth: 0},
                  all: {
                     box: {
                           width: 190,
                           height: 650,
                           stroke: "black",
                           strokeWidth: 0
                          },
                     init() {
                        let bankname = new fabric.Text("bank", {
                           top: 40,
                           left: 100,
                           fontSize: 14,
                           fontWeight: 800,
                           fontFamily: "monospace",
                           fill: "black"
                        })
                        return {bankname}
                     }
                  },
                  where: {left: 10 + (550 + 605) -10 + 0, top: 10},
                  where0: {left: 150, top: 60},
                  init() {
                     let banknum = new fabric.Text(String(this.scopes.bank.index), {
                        top: -19,
                        left: 10,
                        fontSize: 14,
                        fontWeight: 800,
                        fontFamily: "monospace",
                        fill: "black"
                     })
                     return {banknum}
                  },
                  render() {
                     // Update write address highlighting.
                     // (We record and clear the old highlighting (in this.fromInit()) so we don't have to render each instruction individually.)
                     // Unhighlight
                     let unhighlight_addr = this.highlighted_addr
                     let unhighlight = typeof unhighlight_addr != "undefined"
                     let valid_ld = '/instr$valid_ld'.asBool(false)
                     let valid_st = '/instr$valid_st'.asBool(false)
                     let st_mask = '/instr$st_mask'.asInt(0)
                     let addr = '/instr$addr'.asInt(-1) >> 2 // (word-address)
                     let color = valid_st ? "#b0ffff" : "#b0ffff"
                     let highlight = (valid_ld || valid_st) && (addr >= 0 && addr <= 31)
                     // Re-highlight index.
                     if (unhighlight) {
                        this.scopes.instr.children.mem.children[unhighlight_addr].initObjects.box.set({fill: "white"})
                     }
                     if (highlight) {
                        this.scopes.instr.children.mem.children[addr].initObjects.box.set({fill: color})
                     }
                     for (let i = 0; i < 4; i++) {
                        if (unhighlight) {
                           this.scopes.instr.children.bank.children[i].children.mem.children[unhighlight_addr].initObjects.box.set({fill: "white"})
                        }
                        if (highlight && ((st_mask >> i) & 1 != 0)) {
                           this.scopes.instr.children.bank.children[i].children.mem.children[addr].initObjects.box.set({fill: color})
                        }
                     }
                     this.highlighted_addr = highlight ? addr : undefined
                  },
                  layout: {left: -30},
               /mem[31:0]
                  \viz_js
                     box: {
                           fill: "white",
                           width: 30,
                           height: 16,
                           stroke: "#208028",
                           strokeWidth: 0.75
                          },
                     layout: {top: 17},
                     init() {
                        let data = new fabric.Text("", {
                           top: 2,
                           left: 6,
                           fontSize: 14,
                           fontFamily: "monospace"
                        })
                        return {data}
                     },
                     render() {
                        let mod = ('/instr$valid_st'.asBool(false)) && ((('/instr$st_mask'.asInt(-1) >> this.scopes.bank.index) & 1) == 1) && ('/instr$addr'.asInt(-1) >> 2 == this.getIndex()) // selects which bank to write on
                        //let oldValStr = mod ? `(${'$Value'.asInt(NaN).toString(16)})` : "" // old value for dmem
                        this.getInitObject("data").set({text: '$Value'.step(1).asInt(NaN).toString(16).padStart(2,"0")})
                        this.getInitObject("data").set({fill: mod ? "blue" : "black"})
                     }
         
         
         
   
   
   
   
   

\SV
   endmodule
