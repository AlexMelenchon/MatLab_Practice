function [At, bt]= ownTriangulation(A,b)

arraysize=size(A);
r=zeros(arraysize(1),arraysize(2)+1);
r(:,1:arraysize(2))=A;
r(:,end)=b;

for p=1:arraysize(1)
for j=p+1:arraysize(1)
r(j,p:end)=r(p,p)*r(j,p:end)-r(j,p)*r(p,p:end);

end
end

    At=r(:,1:arraysize(2));
    bt=r(:,end);
end
