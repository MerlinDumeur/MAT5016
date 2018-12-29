function [W,A,B,erreur] = train_RBM(Array_train,W,A,B,batch_size,n_epochs)
%TRAIN_RBM Summary of this function goes here
%   Detailed explanation goes here

eta = 1/10;
n_input = 28*28;

n_images = size(Array_train,3);

% disp(n_images);
% disp(n_epochs*n_images/batch_size)
erreur = zeros(n_epochs*n_images/batch_size,1);
erreur = [0];
% disp(size(erreur));
% disp(n_images/batch_size);
% disp((n_images/batch_size)*(3-1));

for k=1:n_epochs
    
    index_random = randperm(n_images);

    for i = 1:n_images/batch_size

        X_minibatch = Array_train(:,:,index_random((1:10)+(i-1)*batch_size));

        X_minibatch = reshape(X_minibatch,[n_input 10]);

        [V1,PHV1,PHX,PV1H0] = CD1(X_minibatch,W,A,B);

        dW = zeros(size(W));
        dA = zeros(size(A));
        dB = zeros(size(B));

        for k =1:size(X_minibatch,3)

            dW = dW + PHX(:,k)*X_minibatch(:,k)' - PHV1(:,k)*V1(:,k)';
            dA = dA + X_minibatch(:,k) - V1(:,k);
            dB = dB + PHX(:,k) - PHV1(:,k);

        end
        

%         disp(n_images/batch_size*(k-1)+i);
        
        erreur(end+1) = sum(vecnorm((PV1H0 - X_minibatch).^2));

        W = W + eta*dW;
        A = A + eta*dA;
        B = B + eta*dB;

    end
    
    eta = eta/10;
    
%     disp(size(erreur))

end