% Enjoy ;)

clear all
close all
clc 
T    = [1.3953 0.6977 0.3488 0.1744 0.0872 0.0436 0.0218];
W    = ['C   ';   'C#  ';   'D   ';   'D#  ';   'E   ';   'F   ';   'F#  ';   'G   ';   'G#  ';   'A   ';   'A#  ';   'B   '   ];
Freq = [0032.7032 0034.6478 0036.7081 0038.8909 0041.2034 0043.6535 0046.2493 0048.9994 0051.9131 0055.0000 0058.2705 0061.7354 ;
        0065.4064 0069.2957 0073.4162 0077.7817 0082.4069 0087.3071 0092.4986 0097.9989 0103.8260 0110.0000 0116.5410 0123.4710 ;
        0130.8130 0138.5910 0146.8320 0155.5630 0164.8140 0174.6140 0184.9970 0195.9980 0207.6520 0220.0000 0233.0820 0246.9420 ;
        0261.6260 0277.1830 0293.6650 0311.1270 0329.6280 0349.2280 0369.9940 0391.9950 0415.3050 0440.0000 0466.1640 0493.8830 ;
        0523.2510 0554.3650 0587.3300 0622.2540 0659.2550 0698.4560 0739.9890 0783.9910 0830.6090 0880.0000 0932.3280 0987.7670 ;
        1046.5000 1108.7300 1174.6600 1244.5100 1318.5100 1396.9100 1479.9800 1567.9800 1661.2200 1760.0000 1864.6600 1975.5300 ;
        2093.0000 2217.4600 2349.3200 2489.0200 2637.0200 2793.8300 2959.9600 3135.9600 3322.4400 3520.0000 3729.3100 3951.0700];
Tempo    = 2.0;
TrnspOct = 0;
v        = 7;

% '<Timing><Octave><Note></Sharp>'
% Jaane Woh Kaise (Tone) - Original - 3m53s - MATLAB - 3m57s
tune1 = '44F 44G 44A 44G 44F 44E 34D';
tune2 = '44F 44G 44A 44G 44F 44E 44D 44E 24F';
tune3 = '35C 45C 44B 35C 34B 45C 35D 45C 34A#';
tune4 = '44A# 44A 44A# 35C 44A# 44A 34G 44A# 24A';
tune5 = '24G 34G 44A 14G 44A 44A# 35C 44G 44F 44E 44G 34F';
tune6 = '24E 34E 44D 44C 54D 54E 44F 44F 44E 34F 34F 44F 34G 44G 44A 34G 44A# 34A';
tune7 = '44F 34A 45C 25D 35D 45C 44A# 44A 34G 44G 34A 44G 35C';
intr1 = '34G 34F';
intr2 = '34F 34A 35C 35D 64A# 74A# 64A 74A 64A# 74A# 64A 74A 64A# 74A# 64A 74A 64A# 74A# 64A 74A 64A# 74A# 64A 74A 64A# 74A# 64A 74A 64A# 74A# 64A 74A 64A# 74A# 64A 74A 34F 34A 35C 35D';
intr3 = '34A# 35C';
intr4 = '34F 34A 35C 35D';
Song = [tune1 tune1 tune2 tune3 tune4 intr1 tune1 tune1 tune2 intr2 tune3 tune4 intr3 tune3 tune4 tune5 tune6 intr3 tune3 tune4 intr1 tune1 tune1 tune2 intr2 tune7 intr4 tune3 tune4 tune5 tune6 intr3 tune3 tune4 intr1 tune1 tune1 tune2 intr2 tune3 tune4 intr3 tune3 tune4 tune5 tune6 intr3 tune3 tune4 intr1 tune1 tune1 tune2];

play = [];
note = 0;
i = 1;
while i < length(Song)-1
   if(Song(i+1)~='#' && Song(i)~='1' && Song(i)~='2' && Song(i)~='3' && Song(i)~='4' && Song(i)~='5' && Song(i)~='6' && Song(i)~='7' && Song(i)~=' ')
       SongNote(note+1,:) = [Song(i) ' ' ' ' ' '];
       Octave(note+1) = str2double(Song(i-1));
       Timing(note+1) = str2double(Song(i-2));
       note = note+1;
       i = i+1;
   elseif(Song(i+1)=='#')
       SongNote(note+1,:)=[Song(i) Song(i+1) ' ' ' '];
       Octave(note+1) = str2double(Song(i-1));
       Timing(note+1) = str2double(Song(i-2));
       i = i+2;
       note = note+1;
   else
       i = i+1;
   end     
end
% Octave
if(Song(end)~='#')
    SongNote(note+1,:)=[Song(end) ' ' ' ' ' '];
    Octave(note+1) = str2double(Song(end-1));
    Timing(note+1) = str2double(Song(end-2));
end

if(( min(Octave) + TrnspOct) > 0 && (max(Octave) + TrnspOct) < 8 )
    Octave = Octave + TrnspOct;
end

% SongNote
for i=1:size(SongNote,1)
    for key=1:size(W,1)
        if(sum(W(key,:)==SongNote(i,1:4))==4)
            play = [play voice(v,Freq(Octave(i),key),T(Timing(i))*Tempo)];
        end
    end
end
sound(play, 20000)