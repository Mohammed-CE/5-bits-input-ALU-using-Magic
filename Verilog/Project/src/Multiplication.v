	 	 module Mul_Adder(
     input   a,
     input   b,	
	  input Sin,
     input cin,	
     output    s,
     output cout );	
	 wire k;
	 assign  k = a & b;
    assign s = k ^ (cin ^ Sin);
 	
    assign cout = (k & Sin)  |  (k & cin)  |  (Sin & cin) ;
endmodule 

module Multiplication(A, B ,P,Cout);
      input [4:0] A;
      input  [4:0] B;
     
	  wire [4:0] s;	
	  wire [4:0] s1;
	  wire [4:0] s2;
	  wire [4:0] s3;
	  wire [4:0] s4;   
      wire [4:0] cout; 
	  wire [4:0] cout1;
	  wire [4:0] cout2;
	  wire [4:0] cout3;	
	  wire [4:0] cout4;
	  wire [4:0] cout5;
      output Cout;
      output  [9:0] P;	   		
	 // first 5 blocks  
   Mul_Adder F0(A[0], B[0], 0, 0, s[0], cout[0]);
   Mul_Adder F1(A[1], B[0], 0, 0, s[1], cout[1]);
   Mul_Adder F2(A[2], B[0], 0, 0, s[2], cout[2]);
   Mul_Adder F3(A[3], B[0], 0, 0, s[3], cout[3]);
   Mul_Adder F4(A[4], B[0], 0, 0, s[4], cout[4]);	
   assign P[0] = s[0];	 
   //second 5 blocks 	
   Mul_Adder F5(A[0], B[1], s[1], cout[0], s1[0], cout1[0]); 
   Mul_Adder F6(A[1], B[1], s[2], cout[1], s1[1], cout1[1]);
   Mul_Adder F7(A[2], B[1], s[3], cout[2], s1[2], cout1[2]);
   Mul_Adder F8(A[3], B[1], s[4], cout[3], s1[3], cout1[3]);
   Mul_Adder F9(A[4], B[1], 0, cout[4], s1[4], cout1[4]);	
   assign P[1] = s1[0];
   //third 5 blocks 
   Mul_Adder F10(A[0], B[2], s1[1], cout1[0], s2[0], cout2[0]);
   Mul_Adder F11(A[1], B[2], s1[2], cout1[1], s2[1], cout2[1]);
   Mul_Adder F12(A[2], B[2], s1[3], cout1[2], s2[2], cout2[2]);
   Mul_Adder F13(A[3], B[2], s1[4], cout1[3], s2[3], cout2[3]);
   Mul_Adder F14(A[4], B[2], 0, cout1[4], s2[4], cout2[4]);	 
   	assign P[2] = s2[0];
   //forth 5 blocks
   Mul_Adder F15(A[0], B[3], s2[1], cout2[0], s3[0], cout3[0]);
   Mul_Adder F16(A[1], B[3], s2[2], cout2[1], s3[1], cout3[1]);
   Mul_Adder F17(A[2], B[3], s2[3], cout2[2], s3[2], cout3[2]);
   Mul_Adder F18(A[3], B[3], s2[4], cout2[3], s3[3], cout3[3]);
   Mul_Adder F19(A[4], B[3], 0, cout2[4], s3[4], cout3[4]);	 
    assign P[3] = s3[0];
   //fifth 5 blocks	 	 
   Mul_Adder F20(A[0], B[4], s3[1], cout3[0], s4[0], cout4[0]);
   Mul_Adder F21(A[1], B[4], s3[2], cout3[1], s4[1], cout4[1]);
   Mul_Adder F22(A[2], B[4], s3[3], cout3[2], s4[2], cout4[2]);
   Mul_Adder F23(A[3], B[4], s3[4], cout3[3], s4[3], cout4[3]);
   Mul_Adder F24(A[4], B[4], 0, cout3[4], s4[4], cout4[4]); 
    assign P[4] = s4[0];
   //last 5 blocks	   
   Adder F25(s4[1], cout4[0],  0, P[5], cout5[0]);
   Adder F26(s4[2],cout4[1],   cout5[0], P[6], cout5[1]);
   Adder F27(s4[3], cout4[2],  cout5[1], P[7], cout5[2]);
   Adder F28(s4[4], cout4[3],  cout5[2],P[8], cout5[3]);
   Adder F29(0,cout4[4],  cout5[3], P[9], Cout); 
endmodule