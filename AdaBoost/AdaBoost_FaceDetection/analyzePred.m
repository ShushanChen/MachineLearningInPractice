function [f_pos, t_pos, f_neg, t_neg] = analyzePred(pred, labels)
    
    f_pos = sum((pred == 1) & (labels == -1));
    t_pos = sum((pred == 1) & (labels == 1));
    
    f_neg = sum((pred == -1) & (labels == 1));
    t_neg = sum((pred == -1) & (labels == -1));
    
    
end