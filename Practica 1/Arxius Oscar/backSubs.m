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
x=zeros(1,arraysize(2));

x(end)=b(end)/A(end,end);%%last case

for t=arraysize(1)-1:1
    for j=t+1:-1:arraysize(2)
        q=A(t,j)*x(j);
    end
    
    x(t)=(b(t)-q)/A(t,t);
end

end

