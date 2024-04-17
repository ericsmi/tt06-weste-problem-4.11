`timescale 1ns / 1ps

////////////////////////////////////////////////////////////

module and_pa_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pa_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pa_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal(1);
`endif
endmodule

