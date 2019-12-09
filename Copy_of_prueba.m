
%%metodo1
myVoice = audiorecorder(8000,16,1);

disp('Start speaking.');
recordblocking(myVoice, 5);
disp('End of recording. Playing back ...');



metodo1 = getaudiodata(myVoice);


%% 
sound(metodo1);


plot(metodo1);

%%

z=fft(metodo1);
z=abs(z);

plot(z((1:end/2)));
%%hold on
% h=z(1:300);
%%
 %%
 Fs=8000; Ts=1/Fs;

Orden=10;
Rizado=1;
Atenuacion=500;
T=0.1;
wc=2*500/Fs;
[B,A]=ellip(Orden,Rizado,Atenuacion,wc);

[H,w]=freqz(B,A,1000);
F=w/pi*Fs/2;
Fase=unwrap(angle(H));
Modulo=20*log10(abs(H));
plot(Modulo);

%%
ere=filter(B,A,metodo1);
%%
sound(ere);
plot(ere);
%%
%%

z2=fft(ere);
z2=abs(z2);

plot(z2((1:end/2)));