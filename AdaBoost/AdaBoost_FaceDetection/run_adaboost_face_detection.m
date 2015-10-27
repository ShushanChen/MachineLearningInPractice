clc; clear; close all;

train_set_face_path = './BoostingData/BoostData1_train_face.txt';
train_set_nonface_path = './BoostingData/BoostData1_train_nonface.txt';
test_set_face_path = './BoostingData/BoostData1_test_face.txt';
test_set_nonface_path = './BoostingData/BoostData1_test_nonface.txt';

isMeanNorm = 1;
isVarNorm = 1;

[train_face, train_num_face, N1, M1] = readImages(train_set_face_path, isMeanNorm, isVarNorm);
[train_nonface, train_num_nonface, N2, M2] = readImages(train_set_nonface_path, isMeanNorm, isVarNorm);

assert(N1 == N2 && M1 == M2);

[test_face, test_num_face, N1, M1] = readImages(test_set_face_path, isMeanNorm, isVarNorm);
[test_nonface, test_num_nonface, N2, M2] = readImages(test_set_nonface_path, isMeanNorm, isVarNorm);

K = 5;
eigenfaces = learnEigenfaces(train_face, K);

[train_set, train_labels] = ConstructFeatureSet(eigenfaces, train_face, train_nonface);
[test_set, test_labels] = ConstructFeatureSet(eigenfaces, test_face, test_nonface);


[classifier] = AdaBoostLearning(train_set, train_labels, 50, 0.0001);



disp('Make classification on testing dataset...');

[test_pred] = ensemblePredict(classifier, test_set);

[f_pos, t_pos, f_neg, t_neg] = analyzePred(test_pred, test_labels);

test_num = test_num_face + test_num_nonface;

disp('');
disp('Prediction result: ');
reportAnalysisResult(f_pos, t_pos, f_neg, t_neg, test_num);