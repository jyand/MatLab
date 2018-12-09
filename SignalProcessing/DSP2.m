fc = 250000
fp = 500000
fs = 2000000
[n,Wn] = buttord(fc/fs, fp/fs,0.5,50)


%Analog Butterworth Filter
[z, p, k] = buttap(n)
[num,den] = zp2tf(z,p,k);
figure(1)
freqs(num,den) %plots freq resp in s domain
title('Analog Butterworth')

%Digital Butterworth Filter
[numd, dend] = bilinear(num, den, fs)
figure(2)
freqz(numd, dend) %plots freq resp in z domain
title('Digital Butterworth')