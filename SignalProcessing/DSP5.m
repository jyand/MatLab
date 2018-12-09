%original signal
F0 = 20
Fs = 40
T = 1/500
t = 0:T:1-T
N = length(t)
xc = cos(2*pi*F0*t)
X = fftshift(fft(xc))
f = -Fs/2:Fs/N:Fs/2-Fs/N
subplot(3, 1, 1), plot(f, abs(X)/N)

%sampled signal
Ts = 1/Fs
n = 0:Ts:1-Ts
x = cos(2*pi*F0*n)
N2 = length(n)
Xn = fftshift(fft(x))
f2 = -Fs/2:Fs/N2:Fs/2-Fs/N2
subplot(3, 1, 2), plot(f2, abs(Xn)/N2)

%reconstructed signal
Tr = 1/5e6
n = 0:Tr:1-Tr
xr = cos(2*pi*F0*n)
N3 = length(n)
Xr = fftshift(fft(xr))
f3 = -Fs/2:Fs/N3:Fs/2-Fs/N3
subplot(3, 1, 3), plot(f3, abs(Xr)/N3)
