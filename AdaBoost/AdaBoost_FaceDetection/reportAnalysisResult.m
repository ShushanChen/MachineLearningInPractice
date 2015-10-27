function [] = reportAnalysisResult(f_pos, t_pos, f_neg, t_neg, test_num)
    msg = sprintf('Total number of testing samples: %d', test_num);
    disp(msg);
    
    msg = sprintf('False Positive: %d', f_pos); disp(msg);
    
    msg = sprintf('True Positive: %d', t_pos); disp(msg);
    
    msg = sprintf('False Negative: %d', f_neg); disp(msg);
    
    msg = sprintf('True Negative: %d', t_neg); disp(msg);
    
    disp('');
    
    msg = sprintf('Total Accuracy: %f', (t_pos + t_neg) / test_num);
    disp(msg);
    
end