%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations

%Puts data from chirp audio into S
S=load('chirp'); 
x=S.y; fs=S.Fs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original Graphs (Unmodified)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%sound(x);
%Discrete Time Graph
subplot(211)
stem(1:length(x), x, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(x))/fs, x, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Amplitude Scaling Applied 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c=100;
y=c*x;
%sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Amplitude Scaling)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal(Amplitude Scaling)','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time Reversal Applied 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
y=flipud(x);
%sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Time Reversal)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal(Time Reversal)','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time Scaling Applied (Upsample)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c=2;
y=upsample(x,c);
sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Time Scaling Upsample)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal(Time Scaling Upsample)','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time Scaling Applied Downsample
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c=2;
y=downsample(x,c);
sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Time Scaling Downsample)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal(Time Scaling Downsample)','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time Shifting Applied
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c=8192;
y=cat(1,zeros(c,1),x);
%sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Time Shifting)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal(Time Shifting)','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Amplitude Shifting Applied 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c=1;
y=x+c;
%sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Amplitude Shifting)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal(Amplitude Shifting)','FontSize',16)