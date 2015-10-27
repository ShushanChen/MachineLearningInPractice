function [eigenfaces] = learnEigenfaces(images, K)
% Learn Eigenfaces form input images
% Return the top K eigenfaces

    corrmatrix = images * images';
    
    [eigvecs, eigvals] = eig(corrmatrix);
    
    eigenfaces = zeros(size(eigvecs, 1), K);

    eig_num = size(eigvecs, 2);

    for i = 0 : K-1
        eigenfaces(:, i + 1) = eigvecs(:, eig_num - i);
    end

end
