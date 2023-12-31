// ALU operations
`define OP_LOAD_A 4'h1
`define OP_LOAD_B 4'h3
`define OP_SHIFT_L 4'h7
`define OP_SHIFT_R 4'h8
`define OP_ADD  4'h9
`define OP_CMP	4'ha
`define OP_NEG  4'hb
`define OP_AND  4'hc
`define OP_OR   4'hd
`define OP_XOR  4'he


module ALU(A, B, aluop, Y);

  parameter N = 16;	// default width = 16 bits
  input  [N-1:0] A;	// A input
  input  [N-1:0] B;	// B input  
  input  [3:0] aluop;	// alu operation
  output reg [N-1:0] Y;	// Y output
  
  always @(*)
    case (aluop)
      `OP_NEG:		Y = {~A};      
      `OP_OR:           Y = {A | B};
      `OP_AND:          Y = {A & B};
      `OP_XOR:          Y = {A ^ B};
      `OP_LOAD_B:       Y = {B};
      `OP_LOAD_A:       Y = {A};      
      `OP_ADD:          Y = {A + B};      
      `OP_CMP:		Y = {A==B, A<B, 14'b0};
      `OP_SHIFT_R: Y = {A >> B};
      `OP_SHIFT_L: Y = {A << B};

      default: Y = {16'b0};
    endcase
endmodule
