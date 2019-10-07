function [x] = backSubs(A,b)
% [x] = backSubs(A,b)
% Performs a backsubstitution process over the matrix [A b]
%	to find x such that A*x = b with A upper triangular
% Inputs:
%	A: Upper triangular coefficients matrix
%	b: Independent term
% Outputs:
%	x: Solution of A*x = b
arraysize=size(A);

x=zeros(arraysize(2),1);

x(end)=b(end)/A(end,end);%%last case

for t=arraysize(1)-1:-1:1
    
    o=A(t,1+t:arraysize(1));%%takes the matrix A and takes the vector row from pivot +1
    p=x(t+1:arraysize(1));%%takes the column of already resolved equations from the X vector

    x(t)=(b(t)-(o*p))/A(t,t);
end

end

