function [flag, At, bt]= ownTriangulationPartialPivoting(A,b)
% [At,bt] = ownTriangulationPartialPivoting(A,b)
% Performs a forward elimination proces over the matrix [A b]
%	such that A*x = b and At*x = bt share the same solution x
%	with partial pivoting
% Inputs:
%	A: Coefficients matrix
%	b: Independent term
% Outputs:
%	flag: Flag = 0 -> The system of LE has a unique solution
%	      Flag = 1 -> The system of LE has infinite or has not a solution		 
%	At: Upper triangular matrix
% 	bt: Modified independent term

%Create a new matrix, setting b as the Modified independent term of A
arraysize=size(A);
x=arraysize(1);
y=arraysize(2);
r=zeros(x,y+1);
r(:,1:y)=A;
r(:,end)=b;
rank = 0;
accumulator = 0;
flag=0;


%TRIANGULATION: Partial Pivoting


%First we sort the possible pivots in all remaining rows (any row that has 
%not been used yet for pivoting) in order to have always the highest
%number possible on the pivot spot for each substituation.

% In this exact same loop, we substitute the subpivot row for itself
% multiplied for the pivot - the pivot row multiplied for the subpivot.

%Knowing that, in order to do the traingulation, the pivot will be the cell
%that is located at the number of columns and rows equal to our number of
%loops, starting from 1. And, that the subpivot is the number at the same
%column number of the pivot, just one row below.




%Loop as many times as the array rows.
for p=1:x
    
    %Bubble sort row order
    for t=p:1:x
    for v=p:1:x - p
        
        if(abs(r(v,p)) < abs(r(v+1,p)))
            aux = r(v,p:end);
            r(v,p:end) = r(v+1,p:end);
            r(v+1,p:end) = aux;
        end
        
    end
    end


%Substitute the subpivot row for itself  multiplied for the pivot - the
%pivot row multiplied for the subpivot.
    for j=p+1:arraysize(1)
    r(j,p:end)=r(p,p)*r(j,p:end)-r(j,p)*r(p,p:end);
    end
    
    
if( p <= x && p <= y)
    if(abs(r(p,p)) <= (1*10.^(-8)))
    flag = 1;
    break;
    end
    if(r(p,p) ~= 0)
    rank = rank +1;
    end
end


    

end


%This process is done until we ran out of rows or columns to iterate with.

%We initialitzate the flag at 0.
%Check the array size of the new matrix
amArraySize = size(r);


if(rank < y)
    flag = 1;
end

%First case: if the matrix has a highter number of columns(unknowns) than
%rows, there's no way we can determine all the unknowns, so the matrix is
%compatible indeterminate.


for i=x:-1:1
    %We sum the dependant vectors and then we substract it from the number
    %of independant vectors; if the result is higher than the numbers of
    %unkowns, the system is compatible indeterminate.

     %If a row is all 0 expect for the independent term, the system is
     %incompatible.
    if(r(i,y)==0 && r(i,y+1)~=0)
        flag=1;
    end
end


    %We return the vars calculated.
    At=r(:,1:arraysize(2));
    bt=r(:,end);
    flag;

end

