function [flag, At, bt]= ownTriangulationPartialPivoting(A,b)

                %TRIANGULATION: Partial Pivoting

%Initial variables

%Create a new matrix, setting b as the Modified independent term of A
arraysize=size(A);
rows=arraysize(1);
col=arraysize(2);
r=[A b];
%We initialitzate the flag at 0.
flag=0; 


%Explanation


%First we sort the possible pivots in all remaining rows (any row that has 
%not been used yet for pivoting) in order to have always the highest
%number possible on the pivot spot for each substituation.

% In this exact same loop, we substitute the subpivot row for itself
% multiplied for the pivot - the pivot row multiplied for the subpivot.

%Knowing that, in order to do the traingulation, the pivot will be the cell
%that is located at the number of columns and rows equal to our number of
%loops, starting from 1. And, that the subpivot is the number at the same
%column number of the pivot, just one row below.

%We check how many pivots will be avaliable for our code to use.
% Ex. If the matrix is 5x3, we could use 3 pivots as max; so we know that
% it will be indeterminate or incompatible.
if(rows >= col)
    z = col;
else
    z = 0;
    flag = 1;
end

%Loop as many times as possible pivots or until we meet a conditions that
%we know will result in a indeterminate or incompatible matrix.
for p=1:z
    
    %Bubble sort row order
    for t=p:1:z
    for v=p:1:z - p
        
        if(abs(r(v,p)) < abs(r(v+1,p)))
            aux = r(v,p:end);
            r(v,p:end) = r(v+1,p:end);
            r(v+1,p:end) = aux;
        end
        
    end
    end
    
    %If the pivot is less than 1e-08, it means that is zero or that matlab 
     if(abs(r(p,p)) <= (1*10.^(-8)))
        flag = 1;
        break;
      end

%Substitute the subpivot row for itself  multiplied for the pivot - the
%pivot row multiplied for the subpivot.
    for j=p+1:z
    r(j,p:end)=r(p,p)*r(j,p:end)-r(j,p)*r(p,p:end);
    end
    
    %If a row is all 0 expect for the independent term, the system is
     %incompatible.
     if(r(p,p) == 0 && r(p,col+1) ~= 0)
     flag = 1;
     break;
     end

end
%This process is done until we ran out of rows or columns to iterate with.


    %RETURNS
    At=r(:,1:col);
    bt=r(:,end);
    flag;

end


