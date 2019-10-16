function [At, bt]= ownTriangulation(A,b)

                              %TRIANGULATION

%Initial variables

%Create a new matrix, setting b as the Modified independent term of A
arraysize=size(A);
r=[A b];

%Loop as many times as the matrix allows us in order to do

%Substitute the subpivot row for itself  multiplied for the pivot - the
%pivot row multiplied for the subpivot.
for p=1:arraysize(1)
for j=p+1:arraysize(1)
r(j,p:end)=r(p,p)*r(j,p:end)-r(j,p)*r(p,p:end);

end
end
%This process is done until we ran out of rows or columns to iterate with.


    %RETURNS
    At=r(:,1:arraysize(2));
    bt=r(:,end);
end
