function [classifier, min_err, final_pred] = trainWeakClassifier(train_set, weights, labels)
% Train the weak classifier based on the training set and provided weights
% @Input:
%   train_set:  training data set
%   weights:    weights for each sample
%   labels:     the correct label for each object
% 
% @output:
%   classifier: 4*1 vector, 
%               dim1 represents the selected dimension,
%               dim2 represents the decision boundary 
%               dim3 represents the label if the sample is on the left towards the decision boundary
%               dim4 represents the weight of classifier in final ensemble classifier
%    err:       prediction error for this decision boundary

    classifier = zeros(4 ,1);
    min_err = sum(weights);
    dims = size(train_set, 2);
    step_num = 10;
    left_label = [-1, 1];

    for i = 1:dims
        range_min = min(train_set(:,i));
        range_max = max(train_set(:,i));
        
        step_size = (range_max + 1 - range_min) / step_num;
        cur_classifier = zeros(4,1);
        cur_classifier(1) = i; 

        for j = range_min: step_size: (range_max+1)
            dec_boundary = j;
            cur_classifier(2) = dec_boundary;

            for k = 1:2
                % label of object if at the left toward the decision boundary
                lab = left_label(k);
                cur_classifier(3) = left_label(k);
                pred = predict(cur_classifier, train_set);
                err = calcError(weights, labels, pred);
                if err < min_err
                    classifier = cur_classifier;
                    min_err = err;
                    final_pred = pred;
                end
            end
        end
    end

end
