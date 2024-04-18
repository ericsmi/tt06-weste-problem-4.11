
def print_ring(p,n):
  a=f"""
{'/'*60}

module ring_osc_part_{p}_h{n}( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_p{p}_h{n} and_p{p}_h{n}_0( .a({{lb, a[4:1], a[0]}}), .y(x[0]));
  invh #(.H({n})) i0(.a(x[0]), .y(z[0]));

  and_p{p}_h{n} and_p{p}_h{n}_1( .a({{a[6],a[4:1],z[0]}}), .y(x[1]));
  invh #(.H({n})) i1(.a(x[1]), .y(z[1]));

  and_p{p}_h{n} and_p{p}_h{n}_2( .a({{a[7],a[4:1],z[1]}}), .y(x[2]));
  invh #(.H({n})) i2(.a(x[2]), .y(z[2]));

endmodule
"""
  print(a)


print('`timescale 1ns / 1ps')

for pp in [ "a", "b", "c", "d" ]:
  for nn in ["1", "5", "20" ]:
     print_ring(pp,nn)

