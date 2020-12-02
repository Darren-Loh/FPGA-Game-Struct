/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu16_8 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z_out,
    output reg v_out,
    output reg n_out
  );
  
  
  
  wire [16-1:0] M_ytoystar_ystar;
  wire [1-1:0] M_ytoystar_cin;
  reg [16-1:0] M_ytoystar_y;
  reg [1-1:0] M_ytoystar_alufn0;
  ytoystar_18 ytoystar (
    .y(M_ytoystar_y),
    .alufn0(M_ytoystar_alufn0),
    .ystar(M_ytoystar_ystar),
    .cin(M_ytoystar_cin)
  );
  
  wire [16-1:0] M_sixteenbitadder_s;
  wire [1-1:0] M_sixteenbitadder_cout;
  reg [16-1:0] M_sixteenbitadder_x;
  reg [16-1:0] M_sixteenbitadder_y;
  reg [1-1:0] M_sixteenbitadder_cin;
  sixteen_bit_adder_19 sixteenbitadder (
    .x(M_sixteenbitadder_x),
    .y(M_sixteenbitadder_y),
    .cin(M_sixteenbitadder_cin),
    .s(M_sixteenbitadder_s),
    .cout(M_sixteenbitadder_cout)
  );
  
  wire [1-1:0] M_compare_cmp0;
  reg [1-1:0] M_compare_alufn2;
  reg [1-1:0] M_compare_alufn1;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  compare16_20 compare (
    .alufn2(M_compare_alufn2),
    .alufn1(M_compare_alufn1),
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .cmp0(M_compare_cmp0)
  );
  
  wire [16-1:0] M_shift_sh;
  reg [16-1:0] M_shift_x;
  reg [4-1:0] M_shift_y;
  reg [2-1:0] M_shift_alufn;
  shift16_21 shift (
    .x(M_shift_x),
    .y(M_shift_y),
    .alufn(M_shift_alufn),
    .sh(M_shift_sh)
  );
  
  wire [16-1:0] M_boole_o;
  reg [16-1:0] M_boole_x;
  reg [16-1:0] M_boole_y;
  reg [4-1:0] M_boole_alufn;
  boole16_22 boole (
    .x(M_boole_x),
    .y(M_boole_y),
    .alufn(M_boole_alufn),
    .o(M_boole_o)
  );
  
  wire [1-1:0] M_zvn_z;
  wire [1-1:0] M_zvn_v;
  wire [1-1:0] M_zvn_n;
  reg [16-1:0] M_zvn_s;
  reg [1-1:0] M_zvn_x15;
  reg [1-1:0] M_zvn_y15;
  reg [1-1:0] M_zvn_alufn0;
  find_zvn_23 zvn (
    .s(M_zvn_s),
    .x15(M_zvn_x15),
    .y15(M_zvn_y15),
    .alufn0(M_zvn_alufn0),
    .z(M_zvn_z),
    .v(M_zvn_v),
    .n(M_zvn_n)
  );
  
  reg [15:0] s;
  
  reg [15:0] c;
  
  reg [15:0] sh;
  
  reg [15:0] bool;
  
  reg z;
  reg v;
  reg n;
  
  reg [15:0] overflow;
  
  always @* begin
    M_ytoystar_y = b[0+15-:16];
    M_ytoystar_alufn0 = alufn[0+0-:1];
    M_sixteenbitadder_x[0+15-:16] = a[0+15-:16];
    M_sixteenbitadder_y[0+15-:16] = M_ytoystar_ystar[0+15-:16];
    M_sixteenbitadder_cin = M_ytoystar_cin[0+0-:1];
    s[0+15-:16] = M_sixteenbitadder_s[0+15-:16];
    M_zvn_alufn0 = alufn[0+0-:1];
    M_zvn_x15 = a[15+0-:1];
    M_zvn_y15 = b[15+0-:1];
    M_zvn_s = s;
    z = M_zvn_z;
    v = M_zvn_v;
    n = M_zvn_n;
    M_compare_alufn1 = alufn[1+0-:1];
    M_compare_alufn2 = alufn[2+0-:1];
    M_compare_z = z;
    M_compare_v = v;
    M_compare_n = n;
    c[0+0-:1] = M_compare_cmp0;
    c[1+14-:15] = 15'h0000;
    M_shift_x = a;
    M_shift_y = b[0+3-:4];
    M_shift_alufn = alufn[0+1-:2];
    sh = M_shift_sh;
    M_boole_x = a;
    M_boole_y = b;
    M_boole_alufn = alufn[0+3-:4];
    bool = M_boole_o;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = s;
      end
      2'h1: begin
        out = bool;
      end
      2'h2: begin
        out = sh;
      end
      2'h3: begin
        out = c;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
    z_out = 1'h0;
    n_out = 1'h0;
    v_out = 1'h0;
    if (alufn == 6'h00 || alufn == 6'h01) begin
      z_out = z;
      n_out = n;
      v_out = v;
    end
    if (alufn == 6'h02) begin
      overflow[0+15-:16] = a * b;
      out = overflow;
      n_out = overflow[15+0-:1];
      if (a[15+0-:1] != overflow[15+0-:1]) begin
        v_out = 1'h1;
      end
    end
  end
endmodule
