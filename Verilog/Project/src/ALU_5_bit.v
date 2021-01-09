 
module ALU_5_bit(A, B, selection, Result,Cout,AlessB, AgreaterB,isZero,isNeg);
      input [4:0] A;
      input [4:0] B;
      input  [1:0] selection;
     output reg [9:0] Result;	
	  reg [9:0] sum,multiplication;
      output reg Cout; 
	  reg cout1,cout2;
	  output reg AlessB, AgreaterB,isZero,isNeg;
	  Multiplication N2(A, B, multiplication,cout2); 
   	  addersubtractor N1(A, B, selection[0], sum, cout1);
	 
	  
	
	always @(*)    begin	
	
    if ( selection == 2'b00 || selection == 2'b01) begin 
	  Result =  sum; 
	  Cout =  cout1;
    end 
	if (selection == 2'b10) begin
    Result = multiplication;   
	 Cout =  cout2;
    end 
	if (selection == 2'b11) begin
    Result[0] = ~A[0]; 
	Result[1] = ~A[1];	 
	Result[2] = ~A[2]; 
	Result[3] = ~A[3];
	Result[4] = ~A[4]; 
    end	
		if(  Result == 0 ) 
	    	isZero = 1;
		else 	 isZero = 0;   
		if(  A < B & selection == 2'b01) 
	    	isNeg = 1;
		else 	 isNeg = 0; 
	    if(  A >= B )  
	    	AgreaterB = 1;
		else 	 AgreaterB = 0;   
		if(  A <= B ) 
	    	AlessB = 1;
		else 	 AlessB = 0; 
end
endmodule
















