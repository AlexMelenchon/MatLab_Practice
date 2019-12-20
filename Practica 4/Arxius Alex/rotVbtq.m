function [ret] = rotVbtq(v,q)
%Normalize v; then conversion to pure quaternion --------------------
v = v/sqrt(v'*v);

v= [0; v];

%Quaternion initialization & normalization---------------------------------------------------------------------
q = q/sqrt(q'*q);
q0=q(1);

qV=q(2:4);

%We know that v' = q*v*qº, but this is equal to the  QL(q)*QR(qº), so
%we're going to do that

%First we declare & assenmble Q; using R(qº)-------------------------------
Q = zeros(4);
Q(1,1) = 1;

R1 = [(q0^2 + qV(1)^2 -qV(2)^2 - qV(3)^2), 2*qV(1)*qV(2) - 2*q0*qV(3), 2*qV(1)* qV(3) + 2*q0*qV(2);];
R2 = [ 2*qV(1)*qV(2) + 2*q0*qV(3),( q0^2 - qV(1)^2 +qV(2)^2 - qV(3)^2), 2*qV(2)*qV(3) - 2 *q0*qV(1)];
R3 = [ 2*qV(1)*qV(3) - 2*q0*qV(2), 2*qV(2)*qV(3) + 2*q0*qV(1), q0^2-qV(1)^2-qV(2)^2 + qV(3)^2;];
R = [R1; R2; R3];

Q(2:4,2:4) = R;

%We get the new vector rotated & we normalize it---------------------------
W = Q*v;

ret = W(2:4);
end