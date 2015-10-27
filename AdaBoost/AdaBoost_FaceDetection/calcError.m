function [err] = calcError(weights, labels, pred)
    err = sum(weights(labels~=pred)); 
end
