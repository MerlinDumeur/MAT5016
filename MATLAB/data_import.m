label = [];

for i = 0:9
    
    fid = fopen('data'+string(i),'r');
    k = 1;
    
    while ~feof(fid)

        
        [t,N] = fread(fid,[28 28],'uchar');
%         disp(N);

        if N > 1

            idx = 1000*i+k;
            Array_im(:,:,idx) = t;
            
            if size(label,1) > 0
                
                label(end+1) = i;
                
            else
                
                label(1) = i;
                
            end
            
        end

        k = k+1;

    end
    
end

Array_im = Array_im/255;
save('MNIST.mat','Array_im','label');