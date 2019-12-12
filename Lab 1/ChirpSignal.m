S=load('chirp'); %Puts data from chirp audio into S
x=S.y; fs=S.Fs;

%This creates the first graph for x[n]
subplot(211)
stem(1:length(x), x, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')
title('Discrete Time Signal','FontSize',16)

%This creates the second graph for x(t)
subplot(212)
plot((1:length(x))/fs, x, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')
title('Continuous Time Signal','FontSize',16)