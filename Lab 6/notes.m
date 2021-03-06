%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, home

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Defining the notes
note=@(freq)cos(2*pi*freq.*[0:1/8000:0.5]);

%Freq of the 4th note in each octave in Hz
C=note(261.63);
Cs=note(277.18);
D=note(293.66);
Ds=note(311.13);
E=note(329.63);
F=note(349.23);
Fs=note(369.99);
G=note(392);
Gs=note(415.3);
A=note(440);
As=note(466.16);
B=note(493.88);

%Power spectral density computation equations
[PC,C]=periodogram(C,hamming(length(C)),length(C),8000,'power');
[PCs,Cs]=periodogram(Cs,hamming(length(Cs)),length(Cs),8000,'power');
[PD,D]=periodogram(D,hamming(length(D)),length(D),8000,'power');
[PDs,Ds]=periodogram(Ds,hamming(length(Ds)),length(Ds),8000,'power');
[PE,E]=periodogram(E,hamming(length(E)),length(E),8000,'power');
[PF,F]=periodogram(F,hamming(length(F)),length(F),8000,'power');
[PFs,Fs]=periodogram(Fs,hamming(length(Fs)),length(Fs),8000,'power');
[PG,G]=periodogram(G,hamming(length(G)),length(G),8000,'power');
[PGs,Gs]=periodogram(Gs,hamming(length(Gs)),length(Gs),8000,'power');
[PA,A]=periodogram(A,hamming(length(A)),length(A),8000,'power');
[PAs,As]=periodogram(As,hamming(length(As)),length(As),8000,'power');
[PB,B]=periodogram(B,hamming(length(B)),length(B),8000,'power');

figure
subplot(621)
plot(C,10*log10(PC),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(C)','FontSize',16,'FontAngle','italic')
title('Note C','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(622)
plot(Cs,10*log10(PCs),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(C#)','FontSize',16,'FontAngle','italic')
title('Note C#','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(623)
plot(D,10*log10(PD),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(D)','FontSize',16,'FontAngle','italic')
title('Note D','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(624)
plot(Ds,10*log10(PDs),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(D#)','FontSize',16,'FontAngle','italic')
title('Note D#','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(625)
plot(E,10*log10(PE),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(E)','FontSize',16,'FontAngle','italic')
title('Note E','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(626)
plot(F,10*log10(PF),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(F)','FontSize',16,'FontAngle','italic')
title('Note F','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(627)
plot(Fs,10*log10(PFs),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(F#)','FontSize',16,'FontAngle','italic')
title('Note F#','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(628)
plot(G,10*log10(PG),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(G)','FontSize',16,'FontAngle','italic')
title('Note G','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(629)
plot(Gs,10*log10(PGs),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(G#)','FontSize',16,'FontAngle','italic')
title('Note G#','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(6,2,10)
plot(A,10*log10(PA),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(A)','FontSize',16,'FontAngle','italic')
title('Note A','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(6,2,11)
plot(As,10*log10(PAs),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(A#)','FontSize',16,'FontAngle','italic')
title('Note A#','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])

subplot(6,2,12)
plot(B,10*log10(PB),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(B)','FontSize',16,'FontAngle','italic')
title('Note B','FontSize',16)
set(gca,'XLim',[0 600]),set(gca,'XTick',[0:50:600])
