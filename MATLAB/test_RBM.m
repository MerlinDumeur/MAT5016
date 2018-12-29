function [erreur,W,A,B] = test_RBM(num_latente,Array_im,n_epochs)
%TEST_RBM Summary of this function goes here
%   Detailed explanation goes here

n_input = 28*28;

size_minibatch = 10;

W = rand(num_latente,n_input);
A = zeros(n_input,1);
B = zeros(num_latente,1);

[W,A,B,erreur] = train_RBM(Array_im,W,A,B,size_minibatch,n_epochs);

end

