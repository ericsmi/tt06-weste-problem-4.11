
def print_ring(p,n):
  a=f"""
{'/'*60}

module and_p{p}_h{n} ( input [5:0] a, output y); 
`ifdef COCOTB_SIM
assign #1 y = &a;
`else
initial $fatal("and_p{p}_h{n} physical design not implemented");
`endif
endmodule
"""
  print(a)


for pp in [ "a", "b", "c", "d" ]:
  for nn in ["1", "5", "20" ]:
     print_ring(pp,nn)

