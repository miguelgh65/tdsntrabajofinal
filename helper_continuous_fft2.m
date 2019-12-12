function continuous_fft(data,dataalto,datamedio,Fs, plotHandle,grafica)
% Calculate FFT(data) and update plot with it. 

lengthOfData = length(data);
nextPowerOfTwo = 2 ^ nextpow2(lengthOfData); % next closest power of 2 to the length

plotScaleFactor = 4;
plotRange = nextPowerOfTwo / 2; % Plot is symmetric about n/2
plotRange = floor(plotRange / plotScaleFactor);

yDFT = fft(data, nextPowerOfTwo); % Discrete Fourier Transform of data
yDFTalto = fft(dataalto, nextPowerOfTwo);
yDFTmedio = fft(datamedio, nextPowerOfTwo);



h = yDFT(1:plotRange);
halto=yDFTalto(1:plotRange);
hmedio=yDFTmedio(1:plotRange);
abs_h = abs(h);
abs_halto = abs(halto);
abs_medio = abs(hmedio);

freqRange = (0:nextPowerOfTwo-1) * (Fs / nextPowerOfTwo);  % Frequency range
gfreq = freqRange(1:plotRange);  % Only plotting upto n/2 (as other half is the mirror image)
% abs_h=[abs_h,abs_halto];


rango=1:300:900;


set(plotHandle, 'ydata', abs_h, 'xdata', gfreq); % Updating the plot
drawnow; % Update the plot
% grafica.YData =[2 2 2];




a=abs_h+abs_halto+abs_medio;
% porcentajealto=abs_halto/a;
% porcentajebajo=abs_h/a;





set(grafica, 'ydata', a, 'xdata', rango ); % Updating the plot
drawnow;


end

