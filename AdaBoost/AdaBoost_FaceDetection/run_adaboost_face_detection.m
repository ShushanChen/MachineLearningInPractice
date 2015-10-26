clc; clear; close all;

train_set_face_path = './BoostingData/BoostData1_train_face.txt';
train_set_nonface_path = './BoostingData/BoostData1_train_nonface.txt';
test_set_face_path = './BoostingData/BoostData1_test_face.txt';
test_set_nonface_path = './BoostingData/BoostData1_test_nonface.txt';

isMeanNorm = 1;
isVarNorm = 1;

[train_face, num_face] = readImages(train_set_face_path, isMeanNorm, isVarNorm);
[train_nonface, num_nonface] = readImages(train_set_nonface_path, isMeanNorm, isVarNorm);

K = 10;

eigenfaces = learnEigenfaces(train_face, K);

sample_num = num_face + num_nonface;

labels = -1*ones(sample_num, 1);
labels(1 : num_face) = 1;


