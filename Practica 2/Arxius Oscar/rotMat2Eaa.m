function [a,u] = rotMat2Eaa(R)
% [a,u] = rotMat2Eaa(R)
% Computes the angle and principal axis of rotation given a rotation matrix R. 
% Inputs:
%    R: rotation matrix
% Outputs:
%    a: angle of rotation in degrees
%    u: axis of rotation 

trace=R(1,1)+R(2,2)+R(3,3);
a=acosd((trace-1)/2);

if(mod(a,180)~=0)
    
Ux=(R-transpose(R))/(2*sind(a));
u=[Ux(3,2);Ux(1,3);Ux(2,1)];

else
    
    if (a == 0)
    u=[0;0;0]; % If the angle is 0, the axis is irrelevant
    end
    
    if (a == 180)
     u = [sqrt((R(3,3)+1)/2), sqrt((R(2,2)+1)/2), sqrt((R(1,1)+1)/2)];
    end
    
end

end
