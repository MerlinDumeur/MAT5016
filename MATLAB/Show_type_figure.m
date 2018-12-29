function Pnum = Show_type_figure(nombre,A,B,W)
%SHOW_TYPE_FIGURE Summary of this function goes here
%   Detailed explanation goes here

H_zero = zeros(size(B));
H_zero(nombre+1) = 1;

Z_zero = A + W'*H_zero;

PVH_zero = sigm(Z_zero);

Pnum = reshape(PVH_zero,[28 28 1]);

end

