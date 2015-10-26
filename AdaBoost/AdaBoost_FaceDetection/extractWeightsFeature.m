%%
% Extract the weights for image based on eigenfaces matrix
%%
function [W] = extractWeightsFeature(eigfaces, img)
    W = eigfaces\img;
end
