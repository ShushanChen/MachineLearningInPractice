function [eigwei_set, labels] = ConstructFeatureSet(eigenfaces, face_set, nonface_set)
% Construct the eigen weight feature for each image
% The face image data and nonface image data will combine together
% Corresponding labels are also made.

    face_eigwei = extractEigenWeight(eigenfaces, face_set);
    nonface_eigwei = extractEigenWeight(eigenfaces, nonface_set);

    num_face = size(face_eigwei, 2);
    num_nonface = size(nonface_eigwei, 2);
    
    eigwei_set = [face_eigwei nonface_eigwei];

    sample_num = num_face + num_nonface;
    labels = -1*ones(sample_num, 1);
    labels(1 : num_face) = 1;

    randperm_idx = randperm(sample_num);
    eigwei_set = eigwei_set(:, randperm_idx);
    
    labels = labels(randperm_idx);
end