

module addersubtractor(A, B, cin ,Result,Cout);
      input [4:0] A;
      input  [4:0] B;
      input cin;
	
	  
      wire [3:0] cout;
      output Cout;
      output  [4:0] Result;	
	 	 wire [4:0] c;
	  	   wire [4:0] x;
  
	   
	assign  c = {cin,cin,cin,cin,cin};
		  	 
	
	assign x = B ^ c;
	  
   Adder F0(A[0], x[0], cin, Result[0],  cout[0]);
   Adder F1(A[1], x[1] ,cout[0], Result[1],  cout[1] );
   Adder F2(A[2], x[2] ,cout[1], Result[2],  cout[2] );
   Adder F3(A[3], x[3] ,cout[2], Result[3], cout[3] );
   Adder F4(A[4], x[4] ,cout[3], Result[4],  Cout);
endmodule