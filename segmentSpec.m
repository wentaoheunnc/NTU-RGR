function [s1, e1, s2, e2] = segmentSpec(spec)

NF = size(spec,1);
offset = 10;
spec(ceil(NF/2)-offset:ceil(NF/2)+offset,:) = [];
tt = sum(spec,1);
tt = movingAverage(tt,10);

[pks,locs] = findpeaks(tt,'MinPeakDistance',20, 'MinPeakHeight',median(tt));
% plot(tt);
% hold on;
% plot(locs,pks,'rx');
% hold off;

s1 = locs(1);
e2 = locs(end);

% % first find the start point of away-from-radar seq
% MN = ceil(numel(tt)/2);
% t1 = tt(:,1:MN);
% [~,s1] = max(t1);
% 
% % first find the ending point of towards-radar seq
% t1 = tt(:,MN:end);
% [~,e2] = max(t1);
% e2 = e2 + MN-1;

% then find the ending point of away-from-radar seq
% it is selected as the point starting deep descending
% [~,e1] = min(tt(s1:e2));
% e1 = e1+s1-1;
% s2 = e1;
O2 = 10;
e1 = round((s1+e2)/2)-O2;
s2 = round((s1+e2)/2)+O2;



