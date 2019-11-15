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

if(mod(a,180)~=0)%if the angle in radians is multiple of pi(180 degrees), the rotation vector will be (0,0,0)
Ux=(R-transpose(R))/(2*sind(a));
u=[Ux(3,2);Ux(1,3);Ux(2,1)];
else
    u=[0;0;0];
end
end
