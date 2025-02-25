function y = movingAverage(x, w)
   k = ones(1, w) / w;
   y = conv(x, k, 'same');
end