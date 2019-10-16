function [At, bt]= ownTriangulation(A,b)

                              %TRIANGULATION

%Initial variables

%Create a new matrix, setting b as the Modified independent term of A
arraysize=size(A);
r=[A b];


% In order to triangulate the matrix, we have to declarate a pivot and a
% subpivot then, we substitute the subpivot row for itself multiplied for
% the pivot - the pivot row multiplied for the subpivot.

%Once this process is finished we do the same thing until we ran out of
%rows or columns.

%Knowing that, in order to do the traingulation, the pivot will be the cell
%that is located at the number of columns and rows equal to our number of
%loops, starting from 1. And, that the subpivot is the number at the same
%column number of the pivot, just one row below.



%Loop as many times as the matrix allows us in order to do
for p=1:arraysize(1)
for j=p+1:arraysize(1)
r(j,p:end)=r(p,p)*r(j,p:end)-r(j,p)*r(p,p:end);
%Substitute the subpivot row for itself  multiplied for the pivot - the
%pivot row multiplied for the subpivot.

end
end
%This process is done until we ran out of rows or columns to iterate with.


    %RETURNS
    At=r(:,1:arraysize(2));
    bt=r(:,end);
end
