module adder(carry_out,sum,a,b,cin);
   input [2:0] a,b;
   input       cin;
   output      carry_out;
   output [2:0] sum;
   assign {carry_out,sum} = a+b+cin;
endmodule
