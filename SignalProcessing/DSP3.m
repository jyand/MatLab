%original signal
F0 = 20
Fs = 40
T = 1/500
t = 0:T:10/F0
xc = cos(2*pi*F0*t)
subplot(3, 1, 1), plot(t, xc)

%sampled signal
Ts = 1/Fs
n = 0:Ts:10/F0
x = cos(2*pi*F0*n)
subplot(3, 1, 2), stem(n, x)

%reconstructed signal
Tr = 1/5e6
n = 0:Tr:10/F0
xr = cos(2*pi*F0*n)
subplot(3, 1, 3), plot(n, xr)

