function [classifier_set] = AdaBoostLearning(train_set, labels, iter_num, error_thres)
% Training the Adaboost Face Detection System on input training set.
% The training process will stop if it meets the max iteration num or
% the training error is less than the error threshold.

    train_set = train_set';
    train_num = size(train_set, 1);
    assert(train_num == length(labels));

    weights = ones(train_num, 1) / train_num;
    
    classifier_set = zeros(iter_num, 4);

    disp('Begin training...');
    
    for i = 1:iter_num
        [classifier, err, pred] = trainWeakClassifier(train_set, weights, labels);
        alpha = 0.5*(log((1-err)/err));
        classifier(4) = alpha;
        classifier_set(i, :) = classifier;

        if (err < error_thres)
            break;
        end

        weights = updateWeight(weights, alpha, pred, labels);
    end

    disp('Finish training!');
    msg = sprintf('The training process uses %d iterations', i);
    disp(msg);
end
