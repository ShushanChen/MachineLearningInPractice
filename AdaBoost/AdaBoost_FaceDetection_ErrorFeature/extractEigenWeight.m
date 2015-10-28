function [W] = extractEigenWeight(eigfaces, images)
% Extract the weights for image based on eigenfaces matrix
    
    W = eigfaces\images;
end
