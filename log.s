     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
         VMOV.F32 s0,#1;
		 VMOV.F32 s1,#1;
		 VMOV.F32 s2,#1;
       	         VMOV.F32 s3,#-1;
		 VMOV.F32 s6,#1;
		 VMOV.F32 s7,#-0.5; converges for |x| val < 1
		 MOV r0,#1;
		 MOV r1,#100;
		 
loop	         CMP  r0,r1;
                 VDIV.F32 s4,s0,s1; -1^(n+1)*1/n
		 VMUL.F32 s6,s6,s7; x^(n-1)*x
		 VFMA.F32 s5,s4,s6; 
		 VADD.F32 s1,s1,s2; n = n+1 
		 VMUL.F32 s0,s0,s3; alternate sign change
                 ADDLT r0,#1;		
	         BNE   loop			 
		 
stop	 B stop 
     ENDFUNC
     END
