/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////

module invh #(parameter H=1) ( input a, output y); 
`ifdef COCOTB_SIM
assign #1 y = ~a;
`else
initial $fatal(1);
`endif
endmodule

////////////////////////////////////////////////////////////

module tt_um_ericsmi_weste_problem_4_11 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [7:0] a;
  wire [3:0] sel;
  wire [2:0] h;
  

  wire ntest;
  wire count;

  wire [11:0] y;
  wire [3:0] b;

  assign a[7:0] = uio_in[7:0];
  assign {ntest,h[2:0],sel[3:0]} = ui_in[7:0];

  assign b[3:0] = { |y[11:9], |y[8:6], |y[5:3], |y[2:0]};

  divider divider(.rst_n(rst_n), .clk(|b), .y(count));

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:0] = {1'b1, ntest, &a, b[3:0], count};
  assign uio_out = 0;
  assign uio_oe  = 0;

  ring_osc_part_a_h1 ring_osc_part_a_h1 ( 
    .en(sel[0]&h[0]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[0])
    );
  ring_osc_part_a_h5 ring_osc_part_a_h5 ( 
    .en(sel[0]&h[1]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[1])
    );  
  ring_osc_part_a_h20 ring_osc_part_a_h20 ( 
    .en(sel[0]&h[2]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[2])
    );

  ring_osc_part_b_h1 ring_osc_part_b_h1 ( 
    .en(sel[1]&h[0]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[3])
    );
  ring_osc_part_b_h5 ring_osc_part_b_h5 ( 
    .en(sel[1]&h[1]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[3])
    );  
  ring_osc_part_b_h20 ring_osc_part_b_h20 ( 
    .en(sel[1]&h[2]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[5])
    );

  ring_osc_part_c_h1 ring_osc_part_c_h1 ( 
    .en(sel[2]&h[0]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[6])
    );
  ring_osc_part_c_h5 ring_osc_part_c_h5 ( 
    .en(sel[2]&h[1]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[7])
    );  
  ring_osc_part_c_h20 ring_osc_part_c_h20 ( 
    .en(sel[2]&h[2]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[8])
    );

  ring_osc_part_d_h1 ring_osc_part_d_h1 ( 
    .en(sel[3]&h[0]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[9])
    );
  ring_osc_part_d_h5 ring_osc_part_d_h5 ( 
    .en(sel[3]&h[1]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[10])
    );  
  ring_osc_part_d_h20 ring_osc_part_d_h20 ( 
    .en(sel[3]&h[2]), 
    .a(a[7:0]),
    .ntest(ntest),
    .y(y[11])
    );

endmodule

////////////////////////////////////////////////////////////

module divider #(parameter WIDTH=4) ( input rst_n, clk, output y);

  wire [WIDTH-1:0] count;
  
  dff counter [WIDTH-1:0] (
    .rst_n({WIDTH{rst_n}}),
    .d(~count),
    .clk({count[WIDTH-2:0],clk}),
    .q(count));
  
  assign y = count[WIDTH-1];

endmodule

////////////////////////////////////////////////////////////

module dff (input rst_n, d, clk, output q);
reg r;
assign q=r;
always @(negedge rst_n or posedge clk)
  if(~rst_n) 
     r<=0;
  else
     r<=d;
endmodule
