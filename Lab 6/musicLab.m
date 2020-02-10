%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, home

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Notes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Defining the notes
note=@(f)cos(2*pi*f.*[0:1/8000:0.5]);

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

%Power spectral density computation function
P=@(note)periodogram(note,hamming(length(note)),length(note),8000,'power');

figure
subplot(621)
plot(P(C),10*log10(P(C)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(C)','FontSize',16,'FontAngle','italic')
title('Note C','FontSize',16)

subplot(622)
plot(P(Cs),10*log10(P(Cs)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(C#)','FontSize',16,'FontAngle','italic')
title('Note C#','FontSize',16)

subplot(623)
plot(P(D),10*log10(P(D)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(D)','FontSize',16,'FontAngle','italic')
title('Note D','FontSize',16)

subplot(624)
plot(P(Ds),10*log10(P(Ds)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(D#)','FontSize',16,'FontAngle','italic')
title('Note D#','FontSize',16)

subplot(625)
plot(P(E),10*log10(P(E)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(E)','FontSize',16,'FontAngle','italic')
title('Note E','FontSize',16)

subplot(626)
plot(P(F),10*log10(P(F)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(F)','FontSize',16,'FontAngle','italic')
title('Note F','FontSize',16)

subplot(627)
plot(P(Fs),10*log10(P(Fs)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(F#)','FontSize',16,'FontAngle','italic')
title('Note F#','FontSize',16)

subplot(628)
plot(P(G),10*log10(P(G)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(G)','FontSize',16,'FontAngle','italic')
title('Note G','FontSize',16)

subplot(629)
plot(P(Gs),10*log10(P(Gs)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(G#)','FontSize',16,'FontAngle','italic')
title('Note G#','FontSize',16)

subplot(6,2,10)
plot(P(A),10*log10(P(A)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(A)','FontSize',16,'FontAngle','italic')
title('Note A','FontSize',16)

subplot(6,2,11)
plot(P(As),10*log10(P(As)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(A#)','FontSize',16,'FontAngle','italic')
title('Note A#','FontSize',16)

subplot(6,2,12)
plot(P(B),10*log10(P(B)),'Color','k'),grid;
xlabel('f','FontSize',16,'FontAngle','italic')
ylabel('P(B)','FontSize',16,'FontAngle','italic')
title('Note B','FontSize',16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Songs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
song_Mary=[E,D,C,D,E,E,E,D,D,D,E,E,E,E,D,C,D,E,E,E,E,D,D,E,D,C];
song_Twinkle=[E,E,B,B,Cs,Cs,B,A,A,Gs,Gs,Fs,Fs,E,B,B,A,A,Gs,Gs,Fs,B,B,A,A,...
    Gs,Gs,Fs,E,E,B,B,Cs,Cs,B,A,A,Gs,Gs,Fs,Fs,E];
song_Barney=[G,E,G,G,E,G,A,G,F,E,D,E,F,E,F,G,C,C,C,C,C,D,E,F,G,G,D,D,F,E,...
    D,C,G,E,G,G,E,G,A,G,F,E,D,E,F,E,F,G,C,C,C,C,C,D,E,F,G,G,D,D,F,E,D,C];
%Mary Plot
figure
specgram(song_Mary,2048,8000,hamming(2048),1024);
%Twinkle Plot
figure
specgram(song_Twinkle,2048,8000,hamming(2048),1024);
%Barney
figure
specgram(song_Barney,2048,8000,hamming(2048),1024);
