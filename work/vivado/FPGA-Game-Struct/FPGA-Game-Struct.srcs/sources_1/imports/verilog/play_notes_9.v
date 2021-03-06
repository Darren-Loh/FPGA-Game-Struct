/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module play_notes_9 (
    input [15:0] ra,
    input [15:0] rb,
    input [2:0] ctr_sel,
    input enable,
    output reg [15:0] test_ra,
    output reg buzz_high,
    output reg buzz_low,
    output reg [3:0] led
  );
  
  
  
  wire [16-1:0] M_buzz_split_double;
  wire [8-1:0] M_buzz_split_even;
  wire [8-1:0] M_buzz_split_odd;
  reg [16-1:0] M_buzz_split_value;
  sig_selector_24 buzz_split (
    .value(M_buzz_split_value),
    .double(M_buzz_split_double),
    .even(M_buzz_split_even),
    .odd(M_buzz_split_odd)
  );
  
  wire [16-1:0] M_led_split_double;
  wire [8-1:0] M_led_split_even;
  wire [8-1:0] M_led_split_odd;
  reg [16-1:0] M_led_split_value;
  sig_selector_24 led_split (
    .value(M_led_split_value),
    .double(M_led_split_double),
    .even(M_led_split_even),
    .odd(M_led_split_odd)
  );
  
  reg buzz;
  
  reg [1:0] led_sel;
  
  always @* begin
    M_led_split_value = ra;
    M_buzz_split_value = rb;
    test_ra = ra;
    led[0+3-:4] = 4'h0;
    buzz_high = 1'h0;
    buzz_low = 1'h0;
    if (enable) begin
      buzz = M_buzz_split_even[(ctr_sel)*1+0-:1];
      led_sel[0+0-:1] = M_led_split_even[(ctr_sel)*1+0-:1];
      led_sel[1+0-:1] = M_led_split_odd[(ctr_sel)*1+0-:1];
      buzz_high = buzz;
      buzz_low = ~buzz;
      
      case (led_sel)
        2'h0: begin
          led[0+0-:1] = 1'h1;
        end
        2'h1: begin
          led[1+0-:1] = 1'h1;
        end
        2'h2: begin
          led[2+0-:1] = 1'h1;
        end
        2'h3: begin
          led[3+0-:1] = 1'h1;
        end
      endcase
    end
  end
endmodule
