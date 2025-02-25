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

for trial_no = 1:10
    for i = 1:98
        dd = rand(L(i),1);
        [~,idx] = sort(dd);
        train_n{i} = sort(idx(1:round(L(i)/2)));
        test_n{i} = sort(idx(round(L(i)/2)+1:end));
    end
    train_seq{trial_no} = train_n;
    test_seq{trial_no} = test_n;
end

save seq train_seq test_seq L;

123