%A=[-3 0 -1;
%   0 -3 -2;
%   0 0 3;]

%b=[-11,2,6]';

%c= backSubs(A,b);

A=[ 2 3  1  1;
    3 2 -1 -2;
    4 -1 -5 1];

b=[9,4,9]';

[flag,At,Bt] = ownTriangulationPartialPivoting(A,b);
