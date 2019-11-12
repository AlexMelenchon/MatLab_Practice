function [R] = Eaa2rotMat(a,u)
% [R] = Eaa2rotMat(a,u)
% Computes the rotation matrix R given an angle and axis of rotation. 
% Inputs:
%	a: angle of rotation
%	u: axis of rotation 
% Outputs:
%	R: generated rotation matrix

u = u(:);

u = u/sqrt(u'*u);

identity = eye(3);

UX = [0,-u(3), u(2);
        u(3), 0, -u(1);
        -u(2), u(1), 0];

R = identity + (sind(a)*UX) + (1-cosd(a))*UX^2

end

