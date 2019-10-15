function [x] = backSubs(A,b)

arraysize=size(A);

x=zeros(arraysize(2),1);

x(end)=b(end)/A(end,end);%%last case

for t=arraysize(1)-1:-1:1
    
    o=A(t,1+t:arraysize(1));%%takes the matrix A and takes the vector row from pivot +1
    p=x(t+1:arraysize(1));%%takes the column of already resolved equations from the X vector

    x(t)=(b(t)-(o*p))/A(t,t);
end

end

