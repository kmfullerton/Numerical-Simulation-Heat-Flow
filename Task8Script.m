% Task 8 Scriptclear, clcx = 0.75; tmax = 10;deltat = 0.1;tvec = 0:deltat:tmax;for i = 1:length(tvec)  t = tvec(i);  Q(i) = heatsource(x,t);endfor%plot(tvec, Q,'.')%grid on%xlabel('Time (s)')%ylabel('Heat Source Function Results')%saveas(1, 'task8fig1.png')% FFT nfft = i;z = Fast_Fourier_Transform(Q, nfft);%plot([1:nfft], z)%grid on% Extract coefficientsN = length(Q);a(1) = (1/N)*real(z(1));b(1) = 0;P(1) = ((a(1)^2) + (b(1)^2))/(2*N);kvec(1) = 1/10;for k = 2:N-1  a(k) = (2/N)*real(z(k+1));  b(k) = (2/N)*imag(z(k+1));  P(k) = ((a(k)^2) + (b(k)^2))/(2*N);  kvec(k) = k/10;endfor      figure(1)  plot(kvec, a,'.')  grid on  xlabel('k/10')  ylabel('ak')  h = gcf;  saveas(h, 'akplot.png')  figure(2)  plot(kvec, b,'.')  grid on  xlabel('k/10')  ylabel('bk')  h = gcf;  saveas(h, 'bkplot.png')    figure(3)  plot(kvec, P)  grid on  xlabel('k/10')  ylabel('Pk')  h = gcf;  saveas(h, 'Pkplot.png')