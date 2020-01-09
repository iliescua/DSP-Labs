%Puts data from gong audio into S
S=load('gong'); 
x=S.y; fs=S.Fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time (Discrete-Time)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

figure
subplot(211)
stem(n,x,'LineWidth',4,'Color','k'),grid
xlabel('n','FontSize',16,'FontAngle','italic')
ylabel('x[n]','FontSize',16,'FontAngle','italic')
title('Discrete-Time Signal','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
plot(t,x,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Continuous-Time Signal','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
a0=1;
b0=0;
b1=1;
b2=2;
b3=3;
b4=4;
b5=5;

% Coefficients (Vectors)
a=[a0];
b=[b0 b1 b2 b3 b4 b5];

% Time (Discrete-Time)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);

figure
subplot(211)
stem(t,x,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Discrete-Time (FIR)','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
stem(t,y,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('Continuous-Time (FIR)','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IIR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
a0=1;
a1=0;
a2=-3/20;
b0=1;

% Coefficients (Vectors)
a=[a0 a1 a2];
b=[b0];

% Time (Discrete-Time)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);

% CT-Error Signal
e = x - y;

figure
subplot(3,1,1)
plot(t,x,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Continuous-Time Input (IIR)','FontSize',16)
set(gca,'FontSize',16)

subplot(3,1,2)
plot(t,y,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('Continuous-Time Output (IIR)','FontSize',16)
set(gca,'FontSize',16)


subplot(3,1,3)
plot(t,e,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('e(t)','FontSize',16,'FontAngle','italic')
title('Continuous-Time Error (IIR)','FontSize',16)
set(gca,'FontSize',16)