close all

for i=0:size(B,1)-1
    figure()
    P = Show_type_figure(i,A,B,W);
    imshow(imresize(P,5));
end