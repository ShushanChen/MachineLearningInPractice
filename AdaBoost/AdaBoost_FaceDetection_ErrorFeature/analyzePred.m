function [f_pos, t_pos, f_neg, t_neg] = analyzePred(pred, labels)
% Analyze the prediction result from following 4 parts:
% False positive, true positive, false negative, true negative

    f_pos = sum((pred == 1) & (labels == -1));
    t_pos = sum((pred == 1) & (labels == 1));
    
    f_neg = sum((pred == -1) & (labels == 1));
    t_neg = sum((pred == -1) & (labels == -1));
    
    
end