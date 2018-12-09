%PartA: Signal
N = 1024 %number of samples
fs = 1000 %sampling frequency @ 1kHz
t = (0:N-1)/fs %time

%discretized signal
x = cos(2*pi*20*t) + cos(2*pi*40*t) + cos(2*pi*75*t)+ cos(2*pi*100*t)+ cos(2*pi*200*t)+ cos(2*pi*300*t) + cos(2*pi*350*t)+ cos(2*pi*440*t) + cos(2*pi*460*t) + cos(2*pi*475*t)
figure(1)
subplot(211)
plot(t, x)
title('Time Domain')
xlabel('t')
ylabel('x(t)')
%spectra
X = fft(x, N)
f = (-N/2:N/2-1)/N %frequency values for plot
subplot(212)
plot(f, abs(X))
title('Frequency Domain')
xlabel('frequency')
ylabel('amplitude')

%PartC: Filter
y = doFilter(x)
figure(2)
subplot(211)
plot(t, y)
title('Time Domain')
xlabel('t')
ylabel('y(t)')
Y = fft(y, N)
subplot(212)
plot(f, abs(Y))
title('Frequency Domain')
xlabel('frequency')
ylabel('amplitude')

