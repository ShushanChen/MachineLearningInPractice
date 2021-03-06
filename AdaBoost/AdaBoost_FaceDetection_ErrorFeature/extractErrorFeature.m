function [errorFeature] = extractErrorFeature(ori_imgs, img_weights, eigenfaces)
% Extract the difference between reconstructed images and original images
    constructed_imgs = eigenfaces * img_weights;
    errorFeature = (ori_imgs - constructed_imgs).^2;
    pixel_num = size(ori_imgs, 1);
    errorFeature = sum(errorFeature)/pixel_num;
end