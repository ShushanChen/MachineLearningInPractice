function [] = AdaBoostLearning(train_set, labels)
    train_num = size(train_set, 1);
    assert(train_num == length(labels));

    weights = ones(train_num, 1) / train_num;
    
    iter_num = 50;
    
    classifier_set = zeros(iter_num, 4);

    for i = 1:iter_num
        [classifier, err, final_pred] = trainWeakClassifier(train_set, weights, labels);
        alpha = 0.5*(log((1-err)/err));
        classifier(4) = alpha;
        classifier_set(i, :) = classifier;


    end

end
