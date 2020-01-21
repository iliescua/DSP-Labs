%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, home

%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations

%Puts audio data from laughter audio into S
S=load('laughter'); 
x=S.y; fs=S.Fs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time (Discrete)
n=1:length(x);

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

figure
subplot(211)
stem(n,x,'Color', 'k'),grid
xlabel('n','FontSize',16,'FontAngle','italic')
ylabel('x[n]','FontSize',16,'FontAngle','italic')
title('Discrete Time Signal for laughgter','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
plot(t,x,'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Continuous Time Signal for laughter','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function (Kronecker Delta Function)
KronDel=@(n_x) heaviside(n_x)-heaviside(n_x-1)

% Discrete Times (System & Input)
n_x=1:length(x);
n_h=1:length(x);
% Signals (System)
h_lpf=0.0016*KronDel(n_h)+0.0057*KronDel(n_h-1)+0.0089*KronDel(n_h-2)+...
    0.0011*KronDel(n_h-3)-0.0240*KronDel(n_h-4)-0.0537*KronDel(n_h-5)-...
    0.0530*KronDel(n_h-6)+0.012*KronDel(n_h-7)+0.1361*KronDel(n_h-8)+...
    0.2621*KronDel(n_h-9)+0.3155*KronDel(n_h-10)+0.2621*KronDel(n_h-11)+...
    0.1361*KronDel(n_h-12)+0.0120*KronDel(n_h-13)-0.0530*KronDel(n_h-14)-...
    0.0537*KronDel(n_h-15)-0.0240*KronDel(n_h-16)+0.0011*KronDel(n_h-17)+...
    0.0089*KronDel(n_h-18)+0.0057*KronDel(n_h-19)+0.0016*KronDel(n_h-20);

% Output Time
ny_beg=n_x(1)+n_h(1);
ny_end=n_x(end)+n_h(end);
n_y=ny_beg:1:ny_end;

% Signal (Output, Matlab)
y_lpf=conv(x,h_lpf);

figure
subplot(311)
stem(n_x,x,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('x[n]','FontSize',12,'FontAngle','italic')
title('Signal (Input)','FontSize',12)

subplot(312)
stem(n_h,h_lpf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('h[n]','FontSize',12,'FontAngle','italic')
title('Signal (System)','FontSize',12)
set(gca,'XLim',[0 20]),set(gca,'XTick',[0:1:20])

subplot(313)
stem(n_y,y_lpf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('y_lpf[n]','FontSize',12,'FontAngle','italic')
title('Convolution (LPF Output)','FontSize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discrete Times (System & Input)
n_x=1:length(x);
n_h=1:length(x);

% Signals (System)
h_hpf=0.0041*KronDel(n_h)-0.0154*KronDel(n_h-1)+0.0110*KronDel(n_h-2)+...
    0.0171*KronDel(n_h-3)-0.0070*KronDel(n_h-4)-0.0348*KronDel(n_h-5)-...
    0.0103*KronDel(n_h-6)+0.0586*KronDel(n_h-7)+0.0648*KronDel(n_h-8)-...
    0.0797*KronDel(n_h-9)-0.3026*KronDel(n_h-10)+0.5883*KronDel(n_h-11)-...
    0.3026*KronDel(n_h-12)-0.0797*KronDel(n_h-13)+0.0648*KronDel(n_h-14)+...
    0.0586*KronDel(n_h-15)-0.0103*KronDel(n_h-16)-0.0348*KronDel(n_h-17)-...
    0.0070*KronDel(n_h-18)+0.0171*KronDel(n_h-19)+0.0110*KronDel(n_h-20)-...
    0.0154*KronDel(n_h-21)+0.0041*KronDel(n_h-22);

% Signal (Output, Matlab)
y_hpf=conv(x,h_hpf);

% Output Time
ny_beg=n_x(1)+n_h(1);
ny_end=n_x(end)+n_h(end);
n_y=ny_beg:1:ny_end;

figure
subplot(311)
stem(n_x,x,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('x[n]','FontSize',12,'FontAngle','italic')
title('Signal (Input)','FontSize',12)

subplot(312)
stem(n_h,h_hpf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('h[n]','FontSize',12,'FontAngle','italic')
title('Signal (System)','FontSize',12)
set(gca,'XLim',[0 22]),set(gca,'XTick',[0:1:22])

subplot(313)
stem(n_y,y_hpf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('y_hpf[n]','FontSize',12,'FontAngle','italic')
title('Convolution (HPF Output)','FontSize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BPF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discrete Times (System & Input)
n_x=1:length(x);
n_h=1:length(x);

% Signals (System)
h_bpf=-0.0005*KronDel(n)-0.0007*KronDel(n-1)+0.0014*KronDel(n-2)+...
    0.0060*KronDel(n-3)+0.0078*KronDel(n-4)+0.0007*KronDel(n-5)-...
    0.0123*KronDel(n-6)+0.0174*KronDel(n-7)-0.0061*KronDel(n-8)+...
    0.0092*KronDel(n-9)+0.0073*KronDel(n-10)-0.0098*KronDel(n-11)-...
    0.0087*KronDel(n-12)+0.0316*KronDel(n-13)+0.0737*KronDel(n-14)+...
    0.0473*KronDel(n-15)-0.0599*KronDel(n-16)-0.1565*KronDel(n-17)-...
    0.1273*KronDel(n-18)+0.00315*KronDel(n-19)+0.1835*KronDel(n-20)+...
    0.1835*KronDel(n-21)+0.0315*KronDel(n-22)-0.1273*KronDel(n-23)-...
    0.1565*KronDel(n-24)-0.0599*KronDel(n-25)+0.0473*KronDel(n-26)+...
    0.0737*KronDel(n-27)+0.0316*KronDel(n-28)-0.0087*KronDel(n-29)-...
    0.0098*KronDel(n-30)+0.0073*KronDel(n-31)+0.0092*KronDel(n-32)-...
    0.0061*KronDel(n-33)-0.0174*KronDel(n-34)-0.0123*KronDel(n-35)+...
    0.0007*KronDel(n-36)+0.0078*KronDel(n-37)+0.0060*KronDel(n-38)+...
    0.0014*KronDel(n-39)-0.0007*KronDel(n-40)-0.0005*KronDel(n-41);

% Signal (Output, Matlab)
y_bpf=conv(x,h_bpf);

% Output Time
ny_beg=n_x(1)+n_h(1);
ny_end=n_x(end)+n_h(end);
n_y=ny_beg:1:ny_end;

figure
subplot(311)
stem(n_x,x,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('x[n]','FontSize',12,'FontAngle','italic')
title('Signal (Input)','FontSize',12)

subplot(312)
stem(n_h,h_bpf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('h[n]','FontSize',12,'FontAngle','italic')
title('Signal (System)','FontSize',12)
set(gca,'XLim',[0 41]),set(gca,'XTick',[0:1:41])

subplot(313)
stem(n_y,y_bpf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('y_bpf[n]','FontSize',12,'FontAngle','italic')
title('Convolution (BPF Output)','FontSize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BSF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discrete Times (System & Input)
n_x=1:length(x);
n_h=1:length(x);

% Signals (System)
h_bsf=-0.0073*KronDel(n)+0.0096*KronDel(n-1)-0.0007*KronDel(n-2)+...
    0.0111*KronDel(n-3)+0.0062*KronDel(n-4)+0.0010*KronDel(n-5)+...
    0.0146*KronDel(n-6)+0.0166*KronDel(n-7)-0.0140*KronDel(n-8)-...
    0.0398*KronDel(n-9)-0.0238*KronDel(n-10)+0.0034*KronDel(n-11)-...
    0.0117*KronDel(n-12)-0.0457*KronDel(n-13)-0.0089*KronDel(n-14)+...
    0.1138*KronDel(n-15)+0.1894*KronDel(n-16)+0.0808*KronDel(n-17)-...
    0.1492*KronDel(n-18)+0.7305*KronDel(n-19)-0.1492*KronDel(n-20)+...
    0.0808*KronDel(n-21)+0.1894*KronDel(n-22)+0.1138*KronDel(n-23)-...
    0.0089*KronDel(n-24)-0.0457*KronDel(n-25)-0.0117*KronDel(n-26)+...
    0.0034*KronDel(n-27)-0.0238*KronDel(n-28)-0.0398*KronDel(n-29)-...
    0.0140*KronDel(n-30)+0.0166*KronDel(n-31)+0.0146*KronDel(n-32)+...
    0.0010*KronDel(n-33)+0.0062*KronDel(n-34)+0.0111*KronDel(n-35)-...
    0.0007*KronDel(n-36)+0.0096*KronDel(n-37)-0.0073*KronDel(n-38);

% Signal (Output, Matlab)
y_bsf=conv(x,h_bsf);

figure
subplot(311)
stem(n_x,x,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('x[n]','FontSize',12,'FontAngle','italic')
title('Signal (Input)','FontSize',12)

subplot(312)
stem(n_h,h_bsf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('h[n]','FontSize',12,'FontAngle','italic')
title('Signal (System)','FontSize',12)
set(gca,'XLim',[0 38]),set(gca,'XTick',[0:1:38])

subplot(313)
stem(n_y,y_bsf,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('y_bsf[n]','FontSize',12,'FontAngle','italic')
title('Convolution (BDF Output)','FontSize',12)