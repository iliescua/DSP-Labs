%Puts audio data from splat audio into S
S=load('splat'); 
x=S.y; fs=S.Fs;
%sound(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time (Discrete)
n=1:length(x);

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

subplot(211)
stem(n,x,'Color', 'k'),grid
xlabel('n','FontSize',16,'FontAngle','italic')
ylabel('x[n]','FontSize',16,'FontAngle','italic')
title('Discrete Time Signal for splat','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
plot(t,x,'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Continuous Time Signal for splat','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIR system (echo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
beta=0.95;
d0=fs/4;
a0=1;
b=zeros(1,d0+1);
b(1,1)=1;
b(1,d0+1)=beta;

% Coefficients (Vectors)
a=[a0];

% Time (Discrete)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);

%sound(y);
figure
subplot(211)
plot(t,x, 'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('FIR Input Signal (Echo)','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
plot(t,y, 'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('FIR Output Signal (Echo)','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IIR system (No echo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
alpha=0.95;
d0=fs/4;
a=zeros(1,d0+1);
a(1,1)=1;
b(1,d0+1)=alpha;
b0=1;

% Coefficients (Vectors)
b=[b0];

% Time (Discrete)
n=[1:length(x)];

% Time (Continuous-Time)
t=[1:(length(x))]/fs;

% Output (Evaluation)
y=filter(b,a,x);
e=x-y;

%sound(y);
figure
subplot(311)
plot(t,x, 'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('IIR Input Signal (no echo)','FontSize',16)
set(gca,'FontSize',16)

subplot(312)
plot(t,y,'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('IIR Output Signal (no echo)','FontSize',16)
set(gca,'FontSize',16)

subplot(313)
plot(t,e,'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('Continuous Time Error Signal','FontSize',16)
set(gca,'FontSize',16)