%original signal
F0 = 20
Fs = 20
T = 1/500
t = 0:T:10/F0
xc = cos(2*pi*F0*t)
subplot(6, 1, 1), plot(t, fft(xc))

%sampled signal
Ts = 1/Fs
n = 0:Ts:10/F0
x = cos(2*pi*F0*n)
subplot(6, 1, 2), stem(n, fft(x))

%reconstructed signal
Tr = 1/5e6
n = 0:Tr:10/F0
xr = cos(2*pi*F0*n)
subplot(6, 1, 3), plot(n, fft(xr))

%original signal
F0 = 20
Fs = 100
T = 1/500
t = 0:T:10/F0
xc = cos(2*pi*F0*t)
subplot(6, 1, 4), plot(t, fft(xc))

%sampled signal
Ts = 1/Fs
n = 0:Ts:10/F0
x = cos(2*pi*F0*n)
subplot(6, 1, 5), stem(n, fft(x))

%reconstructed signal
Tr = 1/5e6
n = 0:Tr:10/F0
xr = cos(2*pi*F0*n)
subplot(6, 1, 6), plot(n, fft(xr))