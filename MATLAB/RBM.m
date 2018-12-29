load MNIST

r = 7:20;
erreur = zeros(length(r),1);

for i = 1:length(r)
   
    err = test_RBM(r(i),Array_im,5);
%     disp(size(err));
    erreur(i) = mean(err(end-1000:end));
    
end

[~,i_min] = min(erreur);

[erreur_min,W,A,B] = test_RBM(r(i_min),Array_im,5);

close all

figure();
plot(r,erreur)

figure();
plot(erreur_min)