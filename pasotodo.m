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











 plotFFT = @(src, event) helper_continuous_fft2(event.Data, src.Rate, hp);
 hl = addlistener(s, 'DataAvailable', plotFFT);











startBackground(s);
figure(hf);
%%
 stop(s);
 s.IsContinuous = false;
 delete(hl);









