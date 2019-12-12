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
wc=2*600/Fs;
[B,A]=ellip(Orden,Rizado,Atenuacion,wc);
wcalto=2*6000/Fs;
[Balto,Aalto]=ellip(Orden,Rizado,Atenuacion,wc,'high');


Fc1=4000*5;
Fc2=5000*5;
Wn = [Fc1 Fc2]/Fs; 
[Bbajo,Abajo]=ellip(Orden,Rizado,Atenuacion,Wn,'bandpass');













figure(2)
grafica = barh([0 0 0]);
yticklabels({'Frecuencias Bajas','Frecuencias Medias','Frecuencias Altas'})
xlabel('Porcentaje de cada tipo de frecuencia en la segnal')





































 plotFFT = @(src, event) helper_continuous_fft2(filter(B,A,event.Data),filter(Balto,Aalto,event.Data),filter(Bbajo,Abajo,event.Data), src.Rate, hp,grafica);
 hl = addlistener(s, 'DataAvailable', plotFFT);











startBackground(s);
figure(hf)
%%
 stop(s);
 s.IsContinuous = false;
 delete(hl);









