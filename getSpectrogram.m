function S = getSpectrogram(dataIQ, decimationFactor, fs, NFFT, OVERLAP)

dataIQ = decimate(dataIQ, decimationFactor);
fs = fs/decimationFactor;

stepSize = round(NFFT*(1-OVERLAP));
startIdcs = 1:stepSize:(length(dataIQ)-NFFT);
dataBlockIdcs = repmat(startIdcs, NFFT, 1) + repmat((0:NFFT-1)', 1, length(startIdcs));
dataBlock = dataIQ(dataBlockIdcs);

dataBlock = dataBlock .* repmat(hamming(NFFT), 1, length(startIdcs)); % windowing
dataBlockSTFT = fftshift(fft(dataBlock),1);
tt = abs(dataBlockSTFT);
%S = 20*log10(tt);
% S = 20*log10(tt+median(tt(:))); % processed one
S = 20*log10(tt); % original one
% S(S<median(S(:))) = median(S(:));
% S = medfilt2(S);

%% normalization
offset = round(NFFT*0.05);
S(NFFT/2-offset:NFFT/2+offset,:) = [];
sMean = mean(S);
%sMean = movingAverage(sMean,100);
for i = 1:size(S,2)
    S(:,i) = (S(:,i)-sMean(i))/std(S(:,i));
end
% S(:,end-50:end) = [];
% S(:,1:50) = [];
S = (S-min(S(:)))/(max(S(:))-min(S(:)))*255;