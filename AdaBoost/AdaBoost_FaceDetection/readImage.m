function [Y, num_images] = readImages(ImagePath, isMeanNorm, isVarNorm)
% Read in images 
% ImagePath: Text file incluing path of all images
% isMeanNorm: Indicate if requires to do mean normalization
% isVarNorm: Indicate if requires to do variance normalization

    filenames = textread('./lfw_images.txt', '%s');
    num_images = length(filenames);

    [N, M] = size(imread(filenames{1}));

    Y = zeros(N*M, num_images);
    for i = 1:num_images
        img = double(imread(filenames{i}));

        if(isMeanNorm == 1)
            img = img - mean(img(:));
        end

        if(isVarNorm == 1)
            img = img - norm(img(:));
        end

        Y(:, i) = img(:);
    end
end
