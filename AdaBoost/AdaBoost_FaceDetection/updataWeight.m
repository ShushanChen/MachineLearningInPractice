%%
% @autor: Shushan Chen
% Update the weights of sample points
% @Input:
%   weights: current weights of sample points
%   alpha:   the parameter to update weights
%   labels:  correct labels of sample points
% @Output:
%   new_weights: Updated new weights
%%
function [new_weights] updataWeights(weights, alpha, pred, labels)
    new_weights = weights.*(exp(-1 * alpha * (labels.*pred)));
    sum_weights = sum(new_weights);
    new_weights = new_weights / sum_weights;
end
