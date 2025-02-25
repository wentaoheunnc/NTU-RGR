
%% Process RFBeam TDMS for K-MC1
clear all;
close all;

rootD = 'dataset\dataset\';
for i = 1:98
    display(int2str(i));
    if i < 10
        userID = ['00' int2str(i)];
    else if i<100
        userID = ['0' int2str(i)];
        else
            userID = int2str(i);
        end
    end
    
    D = dir([rootD userID '\*.mat']);
    for j = 1:numel(D)
        t = 1;
        tic;
        [pathstr,name,ext] = fileparts(D(j).name);
        load([rootD userID '\' D(j).name]);
        spec = get_spectrogram(ConvertedData);
        [s1, e1, s2, e2] = segmentSpec(spec);
        
        S = spec(:,s1:e1);
%         %figure;imshow(uint8(S1));
%         % crop to 2-second frames, overlapping 0.2 second
%         imgW = 30; % around 2 second
%         imgSkip = 10; %around 0.2 second
        % crop to 8-second frames, overlapping 0.2 second
        imgW = 115; % around 2 second
        imgSkip = 10; %around 0.2 second
        t_old = t;
        for imgStart = 1:imgSkip:size(S,2)-imgW+1
            data(:,:,t) = S(:,imgStart:imgStart+imgW-1);
            label(t) = i;
            t = t + 1;
        end
        
        S = spec(:,s2:e2);
        S = fliplr(S);
        S = flipud(S);
        %figure;imshow(uint8(S));
        for imgStart = 1:imgSkip:size(S,2)-imgW+1
            data(:,:,t) = S(:,imgStart:imgStart+imgW-1);
            label(t) = i;
            t = t + 1;
        end
        save(['DataMatrix\' int2str(i) '_' int2str(j) '.mat'],'data');
        clear data;
        toc;
    end
end

