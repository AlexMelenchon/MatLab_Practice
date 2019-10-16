%A=[-3 0 -1;
%   0 -3 -2;
%   0 0 3;]

%b=[-11,2,6]';

%c= backSubs(A,b);

A=[ 1 -2  1 ;
   5 1 7;
 2 -5 3;
 0  0  0];

b=[3,11,4, 21]';

[flag,At,Bt] = ownTriangulationPartialPivoting(A,b);

