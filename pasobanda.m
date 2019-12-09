d = daq.getDevices
dev = d(2)
s = daq.createSession('directsound');
addAudioInputChannel(s, dev.ID, 1);
s.IsContinuous = true
hf = figure;
hp = plot(zeros(1000,1));
T = title('Discrete FFT Plot');
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
grid on;

 Fs=s.Rate; Ts=1/Fs;


Orden=10;
Rizado=1;
Atenuacion=500;
T=0.1;
Fc1=4000*5;
Fc2=5000*5;
Wn = [Fc1 Fc2]/Fs; 
[B,A]=ellip(Orden,Rizado,Atenuacion,Wn,'bandpass');










 plotFFT = @(src, event) helper_continuous_fft2(filter(B,A,event.Data), src.Rate, hp);
 hl = addlistener(s, 'DataAvailable', plotFFT);











startBackground(s);
figure(hf);
%%
 stop(s);
 s.IsContinuous = false;
 delete(hl);









