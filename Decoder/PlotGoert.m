close all
[a] = GoertzelFilter;
sizesA = size(a);
col = sizesA(1,2);
f = [75 100 150 200 300 400 500];
for i=1:col
figure;
stem(f,abs(a((1:7),i)));
end