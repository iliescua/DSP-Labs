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
%sound(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Differentiator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function (Kronecker Delta Function)
KronDel=@(n_x) heaviside(n_x)-heaviside(n_x-1)

% Discrete Times (System & Input)
n_x=1:length(x);
n_h=1:length(x);

% Signals (System)
h_diff=-0.0056*KronDel(n_h)-0.1052*KronDel(n_h-1)+0.1233*KronDel(n_h-2)+...
    0.2461*KronDel(n_h-3)+0.218*KronDel(n_h-4)+0*KronDel(n_h-5)-...
    0.2180*KronDel(n_h-6)-0.2461*KronDel(n_h-7)-0.1233*KronDel(n_h-8)+...
    0.1052*KronDel(n_h-9)+0.0056*KronDel(n_h-10);

% Output Time
ny_beg=n_x(1)+n_h(1);
ny_end=n_x(end)+n_h(end);
n_y=ny_beg:1:ny_end;

% Signal (Output, Matlab)
y_diff=conv(x,h_diff);


% sound(y_diff);

figure
subplot(311)
stem(n_x,x,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('x[n]','FontSize',12,'FontAngle','italic')
title('Signal (Input)','FontSize',12)

subplot(312)
stem(n_h-1,h_diff,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('h[n]','FontSize',12,'FontAngle','italic')
title('Signal (System)','FontSize',12)
set(gca,'XLim',[0 10]),set(gca,'XTick',[0:1:10])

subplot(313)
stem(n_y,y_diff,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('y_D_I_F_F[n]','FontSize',12,'FontAngle','italic')
title('Convolution (DIFF Output)','FontSize',12)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hilbert Transformer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function (Kronecker Delta Function)
KronDel=@(n_x) heaviside(n_x)-heaviside(n_x-1)

% Discrete Times (System & Input)
n_x=1:length(x);
n_h=1:length(x);

% Signals (System)
h_hilb=-0.0814*KronDel(n_h)+0.151*KronDel(n_h-1)-0.4191*KronDel(n_h-2)+...
    0.3327*KronDel(n_h-3)-0.8399*KronDel(n_h-4)+0*KronDel(n_h-5)+...
    0.8399*KronDel(n_h-6)-0.3327*KronDel(n_h-7)+0.4191*KronDel(n_h-8)-...
    0.151*KronDel(n_h-9)+0.0814*KronDel(n_h-10);

% Output Time
ny_beg=n_x(1)+n_h(1);
ny_end=n_x(end)+n_h(end);
n_y=ny_beg:1:ny_end;

% Signal (Output, Matlab)
y_hilb=conv(x,h_hilb);

%sound(y_hilb);

figure
subplot(311)
stem(n_x,x,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('x[n]','FontSize',12,'FontAngle','italic')
title('Signal (Input)','FontSize',12)

subplot(312)
stem(n_h-1,h_hilb,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('h[n]','FontSize',12,'FontAngle','italic')
title('Signal (System)','FontSize',12)
set(gca,'XLim',[0 10]),set(gca,'XTick',[0:1:10])

subplot(313)
stem(n_y,y_hilb,'fill','LineWidth',4,'Color','k','LineStyle','-'),grid
xlabel('n','FontSize',12,'FontAngle','italic')
ylabel('y_H_I_L_B[n]','FontSize',12,'FontAngle','italic')
title('Convolution (HILB Output)','FontSize',12)