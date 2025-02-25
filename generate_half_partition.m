clear all;
close all;
rootD = 'DataMatrix\';
%% This file randomly partitions the dataset into half for training, half for testing.
% mixture of two sections, randomly select the half sequences for training
% and half for testing.

%% calculate how many squences per subject.
L = zeros(98,1); % store the number of sequences per subject.
for i = 1:98
    display(int2str(i));
    t = 0;
    for j = 1:20
        Name = [rootD int2str(i) '_' int2str(j) '.mat'];
        if exist(Name, 'file') == 2
            t = t + 1;
        end
    end
    L(i) = t;
end

    for i = 1:98
        train_n{i} = 1:1:round(L(i)/2);
        test_n{i} = (round(L(i)/2)+1):1:round(L(i));
    end
    train_seq{1} = train_n;
    test_seq{1} = test_n;

save seq_half train_seq test_seq L;

123