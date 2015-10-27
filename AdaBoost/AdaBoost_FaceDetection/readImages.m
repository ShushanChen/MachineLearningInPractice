function [Y, num_images, N, M] = readImages(ImagePath, isMeanNorm, isVarNorm)
% Read in images 
% @Input
%   ImagePath: Text file incluing path of all images
%   isMeanNorm: Indicate if requires to do mean normalization
%   isVarNorm: Indicate if requires to do variance normalization
% @Output
%   Y:  D*N matrix, D is the number of pixels of image, N is the
%       number of image in dataset
%   num_iamges : number of images in the dataset

    filenames = textread(ImagePath, '%s');
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
