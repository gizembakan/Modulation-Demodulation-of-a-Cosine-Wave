%% m(t) = 20*cos(100*pi*t)+10*cos(200*pi*t)işareti için analitik
%% yorumlar:
% m1(t) = 20*cos(100*pi*t) işareti için
% A = 20
% 2*pi*f1*t = 100*pi*t -> f1 = 50 Hz, T1 = 0.02s
% m2(t) = 10*cos(200*pi*t) işareti için
% A = 10
% 2*pi*f2*t = 200*pi*t -> f2 = 100 Hz, T2 = 0.01s
% m(t) işaretinin periyodu, T = 0.02s olarak, m1(t) ve m2(t) işaretlerinin
% periyotlarının ekoklarının alınmasıyla bulunur.
%% m(t) işaretinin çizdirilmesi:
close all;
clear all;
clc;

T = 2*power(10,-2);
t = (0:0.00001:T);
m_t = 20*cos(100*pi*t)+10*cos(200*pi*t);

figure();
plot(t,m_t);
xlabel('zaman(s)');
ylabel('genlik')
title('m(t) = 20*cos(100*pi*t)+10*cos(200*pi*t)');


%% m(t) işaretinin spektrumunun çizdirilmesi:
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı alınmıştır.
m_t = 20*cos(100*pi*t)+10*cos(200*pi*t);
N = length(m_t);
f_axis = linspace(-N/2,N/2-1,fs)*fs/N; % Frekans ekseni normalize
edilmiştir.
m_f = abs(fftshift(fft(m_t)))/N; % fftshift ile f=0 merkezli olacak şekilde dönüşüm elde edilmiştir.

figure();
plot(f_axis, m_f);
xlabel('frekans(Hz)');
ylabel('genlik')
title('M(f) = 10*[dirac(f-50)+dirac(f+50)]+5*[dirac(f-100)+dirac(f+100)]');


%% y(t) işaretinin çizdirilmesi:
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı alınmıştır.
c_t=100*cos(500*pi*t);%carrier signal
y_t = m_t.*c_t;
N = length(y_t);

figure();
plot(t,y_t);
xlabel('zaman(s)');
ylabel('genlik')
title('y(t) = m(t) * c(t)');


%% y(t) işaretinin spektrumunun çizdirilmesi:
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı alınmıştır.
c_t=100*cos(500*pi*t);%carrier signal
y_t = m_t.*c_t;
N = length(y_t);
y_f= abs(fftshift(fft(y_t)))/N;%spectrum of DSB_SC signal
f_axis= linspace(-N/2,N/2-1,fs)*fs/N;

figure();
plot(f_axis,y_f);
xlabel('frekans(Hz)');
ylabel('genlik')
title('Y(f) = F[m(t) * c(t)]');


%% e(t) işaretinin çizdirilmesi:
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı alınmıştır.
c_t=cos(500*pi*t);%carrier signal
e_t = y_t.*c_t;
N = length(e_t);
figure();
plot(t,e_t);
xlabel('zaman(s)');
ylabel('genlik')
title('e(t) = y(t) * c(t)');


%% e(t) işaretinin spektrumunun çizdirilmesi:
close all;
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı
alınmıştır.
c_t = cos(500*pi*t);%carrier signal
e_t = y_t.*c_t;
N = length(e_t);
e_f= abs(fftshift(fft(e_t)))/N;%spectrum of DSB_SC signal
f_axis= linspace(-N/2,N/2-1,fs)*fs/N;

figure();
plot(f_axis,e_f);
xlabel('frekans(Hz)');
ylabel('genlik')
title('E(f) = F[y(t) * c(t)]');


%% z(t) işaretinin spektrumunun çizdirilmesi:
x = linspace(-400,400,10000);% create a rect function
rect = @(x) 1*(sign(x+50) - sign(x-50));% rect func
h = rect(f_axis);
z_f = e_f.*h;

figure();
plot(f_axis,z_f);
xlabel('frekans(Hz)');
ylabel('genlik')
title('Z(f) = F[e(t) * h(t)]');


%% e(t) işaretinin çizdirilmesi (c_t = cos(520*pi*t) için)):
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı alınmıştır.
c_t=cos(520*pi*t);%carrier signal
e_t = y_t.*c_t;
N = length(e_t);

figure();
plot(t,e_t);
xlabel('zaman(s)');
ylabel('genlik')
title('e(t) = y(t) * c(t)');


%% e(t) işaretinin spektrumunun çizdirilmesi (c_t = cos(520*pi*t) için):
fs = 10000; %örnekleme frekansı
t = linspace(-1/2,1/2,fs); % t aralığı (-1/2, 1/2) aralığında fs noktalı alınmıştır.
c_t = cos(520*pi*t);%carrier signal
e_t = y_t.*c_t;
N = length(e_t);
e_f= abs(fftshift(fft(e_t)))/N;%spectrum of DSB_SC signal
f_axis= linspace(-N/2,N/2-1,fs)*fs/N;

figure();
plot(f_axis,e_f);
xlabel('frekans(Hz)');
ylabel('genlik')
title('E(f) = F{y(t) * c(t)}');


%% z(t) işaretinin spektrumunun çizdirilmesi (c_t = cos(520*pi*t) için):
x = linspace(-400,400,10000);% create a rect function
rect = @(x) 1*(sign(x+50) - sign(x-50));% create the time domain slit
function
h = rect(f_axis);
z_f = e_f.*h;

figure();
plot(f_axis,z_f);
xlabel('frekans(Hz)');
ylabel('genlik')
title('Z(f) = F[e(t) * h(t)]');
