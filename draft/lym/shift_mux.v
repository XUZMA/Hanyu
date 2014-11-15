`include "mux2x32.v"

module shift_mux(d,sa,right,arith,sh);
   input [31:0] d;
   input [4:0] 	sa;
   input 	right, arith;
   output [31:0] sh;

   // sign extension according to d[31] and input arith(metic)
   wire 	 a = d[31] & arith;
   wire [15:0] 	 e ={16{a}};
   parameter z = 16'h0000;
   
   wire [31:0] 	 sdl4,sdr4,sdl3,sdr3,sdl2,sdr2,sdl1,sdr1,sdl0,sdr0;

   //
   // difine the types for inner variables(not the ports)
   // else cause compile warning like follows:
   // warning: Port 1 (a0) of mux2x32 expects 32 bits, got 1.
   //
   wire [31:0] 	 t4,s4,t3,s3,t2,s2,t1,s1,t0;

   // shift left 16-bit
   assign sdl4 = {d[15:0],z};
   // shift right 16-bit
   assign sdr4 = {e,d[31:16]};
   // shift left or right according to input right
   mux2x32 m_right4(sdl4,sdr4,right,t4);
   // not shift or shift according to sa[4]
   mux2x32 m_shift4(d,t4,sa[4],s4);

   // shift left 8-bit
   assign sdl3 = {s4[23:0],z[7:0]};
   // shift right 8-bit
   assign sdr3 = {e[7:0],s4[31:8]};
   // shift left or right according to input right
   mux2x32 m_right3(sdl3,sdr3,right,t3);
   // not shift or shift according to sa[3]
   mux2x32 m_shift3(s4,t3,sa[3],s3);

   // shift left 4-bit
   assign sdl2 = {s3[27:0],z[3:0]};
   // shift right 4-bit
   assign sdr2 = {e[3:0],s3[31:4]};
   // shift left or right according to input right
   mux2x32 m_right2(sdl2,sdr2,right,t2);
   // not shift or shift according to sa[2]
   mux2x32 m_shift2(s3,t2,sa[2],s2);

   // shift left 2-bit
   assign sdl1 = {s2[29:0],z[1:0]};
   // shift right 2-bit
   assign sdr1 = {e[1:0],s3[31:2]};
   // shift left or right according to input right
   mux2x32 m_right1(sdl1,sdr1,right,t1);
   // not shift or shift according to sa[1]
   mux2x32 m_shift1(s2,t1,sa[1],s1);

   // shift left 1-bit
   assign sdl0 = {s2[30:0],z[0]};
   // shift right 1-bit
   assign sdr0 = {e[0],s3[31:1]};
   // shift left or right according to input right
   mux2x32 m_right0(sdl0,sdr0,right,t0);
   // not shift or shift according to sa[0]
   mux2x32 m_shift0(s1,t0,sa[0],sh);

endmodule
