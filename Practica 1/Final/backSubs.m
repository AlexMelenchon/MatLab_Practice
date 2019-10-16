function [x] = backSubs(A,b)
% [x] = backSubs(A,b)
% Performs a backsubstitution process over the matrix [A b]
%	to find x such that A*x = b with A upper triangular
% Inputs:
%	A: Upper triangular coefficients matrix
%	b: Independent term
% Outputs:
%	x: Solution of A*x = b

arraysize=size(A); %We save the array size to use it later


x=zeros(arraysize(2),1); %We create a column that will be used as the independant term


x(end)=b(end)/A(end,end);%Calculate the first unkown separatly

%This loop iterates for the rest of rows that have unkowns.
for t=arraysize(1)-1:-1:1
    
    o=A(t,1+t:arraysize(1));%%takes the matrix A and takes the vector row from pivot +1
    p=x(t+1:arraysize(1));%%takes the column of already resolved equations from the X vector

    x(t)=(b(t)-(o*p))/A(t,t);
end

end

