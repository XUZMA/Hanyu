`include "gates7_dataflow.v"

module gates7_dataflow_test;
   reg a,b;
   gates7_dataflow g7 (a,b,f_and,f_or,f_not,f_nand,f_nor,f_xor,f_xnor);

   initial
     begin
	$display("time\ta\tb\tf_and\tf_or\tf_not\tf_nand\tf_nor\tf_xor\tf_xnor");
	#0 a = 0; b = 0;
	#1 a = 1; b = 0;
	#1 a = 0; b = 1;
	#1 a = 1; b = 1;
	#1 a = 0; b = 0;
	#1 $finish;
    end

   initial
     begin
	$monitor("%2d:\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",$time,a,b,f_and,f_or,f_not,f_nand,f_nor,f_xor,f_xnor);
	$dumpfile("gate7_dataflow.vcd");
	$dumpvars;
     end

endmodule
