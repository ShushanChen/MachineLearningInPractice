function [finalPred] = ensemblePredict(classifiers, data_set)
% Make prediction based on the ensemble classifier

    data_set = data_set';
    finalPred = zeros(size(data_set, 1), 1);
    
    for i = 1:size(classifiers, 1)
        pred = predict(classifiers(i, :), data_set);
        finalPred = finalPred + pred*classifiers(i, 4);
    end
    
    finalPred(finalPred > 0) = 1;
    finalPred(finalPred < 0) = -1;
    
end