%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all, home

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining Notes
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
song_Spider=[G,C,C,C,D,E,E,E,D,C,D,E,C,E,E,F,G,G,F,E,F,G,E,C,C,D,E,E,D,C,...
    D,E,C,G,C,C,C,D,E,E,E,D,C,D,E,C];

%Spider Plot
figure
specgram(song_Spider,2048,8000,hamming(2048),1024);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
song_Bridge=[G,A,G,F,E,F,G,D,E,F,E,F,G,G,A,G,F,E,F,G,D,G,E,C,G,A,G,F,E,F,...
    G,D,E,F,E,F,G,G,A,G,F,E,F,G,D,G,E,C];

%Bridge Plot
figure
specgram(song_Bridge,2048,8000,hamming(2048),1024);