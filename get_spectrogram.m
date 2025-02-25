function spec = get_spectrogram(ConvertedData)

%load('K-MC1_default_.mat');
%load('RenJianFeng_1.mat');
%load('LiuAnKang_1.mat');
%load('test1.mat');
%load('1.mat');
%load('temp.mat');
% load('010.mat');

chI = ConvertedData.Data.MeasuredData(3).Data;
chQ = ConvertedData.Data.MeasuredData(4).Data;

% Assumes that both channels have identical settings
startTime = ConvertedData.Data.MeasuredData(3).Property(1).Value;
deltaT    = ConvertedData.Data.MeasuredData(3).Property(3).Value;
frameSize = ConvertedData.Data.MeasuredData(3).Property(4).Value;
fs = round(1/deltaT);

x = chI + 1i*chQ;

%% 1 sample per seq
dataIQ = x;
% save('data.mat','dataIQ', 'fs');

decimationFactor = 64;
NFFT = 128;
OVERLAP = 0;

spec = getSpectrogram(dataIQ, decimationFactor, fs, NFFT, OVERLAP);
% imshow(uint8(tt));
% imwrite(uint8(tt),filename,'bmp');



