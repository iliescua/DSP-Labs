%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations

%Puts data from train audio into S
S=load('train'); 
x=S.y; fs=S.Fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
a0=1;
b0=1;
b1=1/2;
b2=3;
b3=0;
b4=0;
b5=1;

% Coefficients (Vectors)
a=[a0];
b=[b0 b1 b2 b3 b4 b5];

% Time (Discrete)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);

figure
subplot(211)
stem(n,x,'fill','LineWidth',4,'Color','k'),grid
xlabel('n','FontSize',16,'FontAngle','italic')
ylabel('x[n]','FontSize',16,'FontAngle','italic')
title('Signal (Input)','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
stem(t,x,'fill','LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Signal (Output)','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIR system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
a0=1;
b0=1;
b1=1/2;
b2=3;
b3=0;
b4=0;
b5=1;

% Coefficients (Vectors)
a=[a0];
b=[b0 b1 b2 b3 b4 b5];

% Time (Discrete)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);

figure
subplot(211)
stem(t,x,'fill','LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Signal (Input)','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
stem(t,y,'fill','LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('Signal (Output)','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IIR system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
a0=1;
a1_1=0.5;
a1_2=-0.5;
a1_3=0.9;
a1_4=0.95;
a1_5=0.99;
a1_6=1;
a1_7=1.1;
b0=1;

% Coefficients (Vectors)
a_1=[a0 a1_1];
a_2=[a0 a1_2];
a_3=[a0 a1_3];
a_4=[a0 a1_4];
a_5=[a0 a1_5];
a_6=[a0 a1_6];
a_7=[a0 a1_7];
b=[b0];

% Time (Discrete)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);

figure
subplot(4,2,1)
plot(t,x,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('X signal','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,2)
plot(t,y_1,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=0.5','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,3)
plot(t,y_2,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=-0.5','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,4)
plot(t,y_3,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=0.9','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,5)
plot(t,y_4,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=0.95','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,6)
plot(t,y_5,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=0.99','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,7)
plot(t,y_6,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=1','FontSize',16)
set(gca,'FontSize',16)

subplot(4,2,8)
plot(t,y_7,'LineWidth',4,'Color','k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('a=1.1','FontSize',16)
set(gca,'FontSize',16)