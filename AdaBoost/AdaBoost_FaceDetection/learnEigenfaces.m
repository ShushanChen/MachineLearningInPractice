function [eigenfaces] = learnEigenfaces(images, K)

    corrmatrix = images * images';
    
    [eigvecs, eigvals] = eig(corrmatrix);
    
    eigenfaces = zeros(size(eigvecs, 1), K);

    img_num = size(images, 2);

    for i = 0 : k-1
        eigenfaces(:, i + 1) = eigvecs(:, img_num - i);
    end

end