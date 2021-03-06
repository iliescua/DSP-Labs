%Loading in a signal and applying various signal 
%operations to it and then graphing the results to 
%better model the impact of these operations

%Puts data from chirp audio into S
S=load('handel'); 
x=S.y; fs=S.Fs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original Graphs (Question 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
sound(x);
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
%Time Scaling Upsample (Question 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c = 2;
y = upsample(x,c);
%sound(y);
%Discrete Time Graph
subplot(211)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Upsample)','FontSize',16)
%Continuous Time Graph
subplot(212)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal (Upsample)','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time Scaling Downsample (Question 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
c = 2;
k = 4;
j = 6;
y = downsample(x,c);
z = downsample(x,k);
a = downsample(x,j);
%sound(y);
%sound(z);
%sound(a);
%Discrete Time Graph
subplot(221)
stem(1:length(y), y, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal (Downsample)','FontSize',16)
%Continuous Time Graph for 2 
subplot(222)
plot((1:length(y))/fs, y, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal (Downsample c=2)','FontSize',16)
%Continuous Time Graph for 2
subplot(223)
plot((1:length(z))/fs, z, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal (Downsample c=4)','FontSize',16)
%Continuous Time Graph for 2
subplot(224)
plot((1:length(a))/fs, a, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal (Downsample c=6)','FontSize',16)