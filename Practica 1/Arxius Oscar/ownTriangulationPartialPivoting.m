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

arraysize=size(A);
r=zeros(arraysize(1),arraysize(2)+1);
r(:,1:arraysize(2))=A;
r(:,end)=b;


for p=1:arraysize(1)
    
    for q=p:arraysize(1)
        for z=p:(arraysize(1))-1
        
            if r(z,p)<r(z+1,p)
                aux=r(z,:);
                r(z,:)=r(z+1,:);
                r(z+1,:)=aux;
            end
        
        end
    end
    
    
    
    for j=p+1:arraysize(1)
    r(j,p:end)=r(p,p)*r(j,p:end)-r(j,p)*r(p,p:end);

    end
end



end
