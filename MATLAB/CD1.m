function [V1,PHV1,PHX,PV1H0] = CD1(X,W,A,B)
%CD1 Summary of this function goes here
%   Detailed explanation goes here

n = size(X,2);

Z1 = repmat(B,1,n) + W*X;
PHX = sigm(Z1);

H0 = binornd(1,PHX);

Z2 = repmat(A,1,n) + W'*H0;
PV1H0 = sigm(Z2);
V1 = binornd(1,PV1H0);

Z3 = repmat(B,1,n) + W*V1;
PHV1 = sigm(Z3);

end