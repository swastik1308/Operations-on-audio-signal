ec=5;
fc=3000;
fs=8000;
fdev=10;
t = (0:1/fs:0.2);
x=input('Type S and press enter to start recording', 's');
if x== 'S';
    voice = audiorecorder;
    disp('Recording started');
recordblocking(voice, 10);
disp('Recording stopped');
o = getaudiodata(voice);
filename = 'reordedAudio.wav';
audiowrite(filename,o,fs);
clear o fs
[o,fs]=audioread(filename);
subplot(4,1,1);
plot(o);
title('Original Signal');
c=ec*2*pi*fc*t;
subplot(4,1,2);
plot(c);
title('Carrier Signal');
m=fmmod(o, fc, fs, fdev);
subplot(4,1,3);
plot(m);
title('Modulated Signal');
d=fmdemod(m,fc,fs,fdev);
subplot(4,1,4);
plot(d);
title('Demodulated Signal');
pause(5);
sound(d);
else
    disp('You did not press the correct key')
end