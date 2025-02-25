clear all;
close all;

rootD = '..\PCA_SVM_CVD_v1\DataMatrix\';
load seq;
trial_no = 1;
train_n = train_seq{trial_no};
test_n = test_seq{trial_no};
%% generate training CVD
t = 1;
CVD_train = zeros(98*10*40,115,115);
for i = 1:98 %??????
    mkdir('datacvd_pro2\train\', num2str(i));
    display(int2str(i));
    tic;
    t_old = t;
    train_idx = train_n{i};% ???????????train??ndex??eq??????????
    for temp = 1:numel(train_idx)%??????ndex???????equence???????
        j = train_idx(temp);
        Name = [rootD int2str(i) '_' int2str(j) '.mat'];
        if exist(Name, 'file') == 2
            load(Name); %???data 115 * 115???????????egment
            for k = 1:size(data,3)
%                 CVD_train(t,:,:) = data(:,:,k);
                CVD_train(t,:,:) = mat2gray(log10(abs(fft(data(:,:,k)')')));                
                tmp = reshape(CVD_train(t,:,:), 115, 115);
%                 tmp2 = zeros(115,115,3);
%                 tmp2(:,:,1) = tmp;
%                 imwrite(uint8(tmp), ['dataset\train\' num2str(i) '\' num2str(t) '.PNG']);
                imwrite(tmp, ['datacvd_pro2\train\' num2str(i) '\' num2str(t) '.PNG']);
%                  figure;imshow(tmp);
                 t = t + 1;
            end
            L_train(i,temp) = size(data,3);
        end
    end
    train_label(t_old:t-1) = i;
    toc;
end


%% generate training CVD
t = 1;
CVD_test = zeros(98*10*40,115,115);
for i = 1:98
    mkdir('datacvd_pro2\test\', num2str(i));
    display(int2str(i));
    tic;
    t_old = t;
    test_idx = test_n{i};
    for temp = 1:numel(test_idx)
        j = test_idx(temp);
        Name = [rootD int2str(i) '_' int2str(j) '.mat'];
        if exist(Name, 'file') == 2
            load(Name);
            
            for k = 1:size(data,3)
%                 CVD_test(t,:,:) = data(:,:,k);  
                CVD_test(t,:,:) = mat2gray(log10(abs(fft(data(:,:,k)')')));
                tmp = reshape(CVD_test(t,:,:), 115, 115);
%                 tmp2 = zeros(115,115,3);
%                 tmp2(:,:,1) = tmp;
%                 imwrite(uint8(tmp), ['dataset\test\' num2str(i) '\' num2str(t) '.PNG']);
                imwrite(tmp, ['datacvd_pro2\test\' num2str(i) '\' num2str(t) '.PNG']);
                t = t + 1;
                % figure;imshow(data(:,:,k));
            end
            L_test(i,temp) = size(data,3);
        end
    end
    test_label(t_old:t-1) = i;
    toc;
end

% save L_test_half L_test
