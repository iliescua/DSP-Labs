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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Songs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
song_Mary=[E,D,C,D,E,E,E,D,D,D,E,E,E,E,D,C,D,E,E,E,E,D,D,E,D,C];
song_Twinkle=[E,E,B,B,Cs,Cs,B,A,A,Gs,Gs,Fs,Fs,E,B,B,A,A,Gs,Gs,Fs,B,B,A,A,...
    Gs,Gs,Fs,E,E,B,B,Cs,Cs,B,A,A,Gs,Gs,Fs,Fs,E];
song_Barney=[G,E,G,G,E,G,A,G,F,E,D,E,F,E,F,G,C,C,C,C,C,D,E,F,G,G,D,D,F,E,...
    D,C,G,E,G,G,E,G,A,G,F,E,D,E,F,E,F,G,C,C,C,C,C,D,E,F,G,G,D,D,F,E,D,C];

sound(song_Barney);

%Mary Plot
figure
specgram(song_Mary,2048,8000,hamming(2048),1024);
title('Mary Had A Little Lamb','FontSize',16)
set(gca,'YLim',[0 600]),set(gca,'YTick',[0:50:600])

%Twinkle Plot
figure
specgram(song_Twinkle,2048,8000,hamming(2048),1024);
title('Twinkle Twinkle Little Star','FontSize',16)
set(gca,'YLim',[0 600]),set(gca,'YTick',[0:50:600])

%Barney
figure
specgram(song_Barney,2048,8000,hamming(2048),1024);
title('I Love You (Barney)','FontSize',16)
set(gca,'YLim',[0 600]),set(gca,'YTick',[0:50:600])