clear all
autosums = zeros(16)
crosssums = zeros(16)
ac = dsp.Autocorrelator
xcorr = dsp.Crosscorrelator
t = 0:1:39
tt = 1:1:79
V = xlsread('voltage.xls')
figure
subplot(2, 1, 1)
plot(t, V)
Y = step(ac, V)
subplot(2, 1, 2)
plot(t, Y)
bin = xlsread('bin.xls')
for i = 1:1:16
    autosums(i) = sum(step(ac, bin(:, i)))
    crosssums(i) = sum(step(xcorr, Y, bin(:, i)))
    figure
    subplot(3, 1, 1)
    plot(t, bin(:, i))
    subplot(3, 1, 2)
    plot(t, step(ac, bin(:, i)))
    subplot(3, 1, 3)
    plot(tt, step(xcorr, Y, bin(:, i)))
end
