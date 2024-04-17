`timescale 1ns / 1ps

////////////////////////////////////////////////////////////

module and_pa_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pa_h1 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pa_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pa_h5 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pa_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pa_h20 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pb_h1 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pb_h5 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pb_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pb_h20 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pc_h1 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pc_h5 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pc_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pc_h20 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h1 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pd_h1 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h5 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pd_h5 physical design not implemented");
`endif
endmodule


////////////////////////////////////////////////////////////

module and_pd_h20 ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_pd_h20 physical design not implemented");
`endif
endmodule

