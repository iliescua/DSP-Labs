S=load('chirp');
x=S.y; fs=S.Fs;
z = (1:length(x))/fs;

subplot(211)
stem(1:length(x), x, 'Color', 'k')
xlabel('n','FontSize',14,'FontAngle','italic')
ylabel('x[n]','FontSize',14,'FontAngle','italic')

subplot(212)
plot(1:length(z), z, 'Color', 'k')
xlabel('t','FontSize',14,'FontAngle','italic')
ylabel('x(t)','FontSize',14,'FontAngle','italic')