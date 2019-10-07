A=[1 4 3 9;
   0 3 8 12;
   0 0 2 3;
   0 0 0 2];

b=[2,7,1,5]';

c= backSubs(A,b);

A=[ 1 -2  1 ;
 2 -5 3; 
 5 1 7];

b=[3,4,11]';

%%[H,f]=ownTriangulation(A,b);
[flag,H,f]=ownTriangulationPartialPivoting(A,b)


