function [err] = calcError(weights, labels, pred)
% Calculate the weighted error for learning adaboost classifier

    err = sum(weights(labels~=pred)); 
end
