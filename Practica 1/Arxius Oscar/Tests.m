A=[1 4 3 9;
   0 3 8 12;
   0 0 2 3;
   0 0 0 2];

b=[2,7,1,5]';

c= backSubs(A,b);

A=[ 2 3  1  1;
    3 2 -1 -2;
    4 -1 -5 1];

b=[9,4,9]';

[H,f]=ownTriangulation(A,b);