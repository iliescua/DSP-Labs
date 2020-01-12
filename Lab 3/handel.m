%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations

%Puts audio data from handel audio into S
S=load('handel'); 
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
title('Discrete Time Signal for handel','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
plot(t,x,'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('x(t)','FontSize',16,'FontAngle','italic')
title('Continuous Time Signal for handel','FontSize',16)
set(gca,'FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FIR system (echo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
beta=0.95;
d0=fs/2;
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
%FIR system (reverberation)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coefficients (Constants)
c=343;
d1=round((fs*17.2)/c);
d2=round((fs*34.3)/c);
disp(d1);
disp(d2);

a0=1;
b=zeros(1,d2+1);
b(1,1)=0;
b(1,d1+1)=4/5;
b(1,d2+1)=3/5;

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
title('FIR Input Signal (Reverb)','FontSize',16)
set(gca,'FontSize',16)

subplot(212)
plot(t,y,'Color', 'k'),grid
xlabel('t','FontSize',16,'FontAngle','italic')
ylabel('y(t)','FontSize',16,'FontAngle','italic')
title('FIR Output Signal (Reverb)','FontSize',16)
set(gca,'FontSize',16)