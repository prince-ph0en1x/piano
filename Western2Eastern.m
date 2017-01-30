% function Western2Eastern
clear all
close all
clc 
W = ['C   ';'C#  ';'D   ';'D#  ';'E   ';'F   ';'F#  ';'G   ';'G#  ';'A   ';'A#  ';'B   '];
E = ['Sa  ';'re  ';'Re  ';'ga  ';'Ga  ';'Ma  ';'MA  ';'Pa  ';'dha ';'Dha ';'ni  ';'Ni  '];
T = [1.3953 0.6977 0.3488 0.1744 0.0872 0.0436 0.0218];
O1 = [32.7032 34.6478 36.7081 38.8909 41.2034 43.6535 46.2493 48.9994 51.9131 55.0000 58.2705 61.7354];
O2 = [65.4064 69.2957 73.4162 77.7817 82.4069 87.3071 92.4986 97.9989 103.8260 110.0000 116.5410 123.4710];
O3 = [130.8130 138.5910 146.8320 155.5630 164.8140 174.6140 184.9970 195.9980 207.6520 220.0000 233.0820 246.9420];
O4 = [261.6260 277.1830 293.6650 311.1270 329.6280 349.2280 369.9940 391.9950 415.3050 440.0000 466.1640 493.8830];
O5 = [523.2510 554.3650 587.3300 622.2540 659.2550 698.4560 739.9890 783.9910 830.6090 880.0000 932.3280 987.7670];
O6 = [1046.5 1108.73 1174.66 1244.51 1318.51 1396.91 1479.98 1567.98 1661.22 1760 1864.66 1975.53];
O7 = [2093 2217.46 2349.32 2489.02 2637.02 2793.83 2959.96 3135.96 3322.44 3520 3729.31 3951.07];

% Song = '4E4E4E4D4C4D4D3B4C4C4C4C4C4C4C4C3G3A4C4C4D4E4E4F4E4E4E4D4F4E4D4C4E4E4E4D4C4D4D3B4C4C4C4C';
%Song = '4C4C#4D4D#4E4F4F#4G4G#4A4A#4B';
%Song = '4C4C#4E4F4G4G#4B5C5C4B4G#4G4F4E4C#4C';
%Song = '7G4G';
Song = '4F4G4A4G4F4E4D4D4F4G4A4G4F4E4D4D4F4G4A4G4F4E4D4E4F4F4F4F4F4F5C5C5C5C5C5C4B5C5D5D5D5D5C4A#4A#4A#5C5C4A#4A4G4G4A#4A4G4G4A4A4A4A4A4F4G4A4G4F4E4D4D4F4G4A4G4F4E4D4D4F4G4A4G4F4E4D4E4F4F';%4F4G4A4G4F4E4D4D4F4G4A4G4F4E4D4D4F4G4A4G4F4E4D4E4F4F 
% Song = '14F';
play = [];
note = 0;
i = 1;
v = 1;
t = T(4);
while i < length(Song)-1
   if(Song(i+1)~='#' && Song(i)~='1' && Song(i)~='2' && Song(i)~='3' && Song(i)~='4' && Song(i)~='5' && Song(i)~='6' && Song(i)~='7')
       SongNote(note+1,:) = [Song(i) ' ' ' ' ' '];
       Octave(note+1) = Song(i-1);
%        Timing(note+1) = Song(i-2);
       note = note+1;
       i = i+1;
   elseif(Song(i+1)=='#')
       SongNote(note+1,:)=[Song(i) Song(i+1) ' ' ' '];
       Octave(note+1) = Song(i-1);
%        Timing(note+1) = Song(i-1);
       i = i+2;
       note = note+1;
   else
       i = i+1;
   end     
end
% Octave
if(Song(end)~='#')
    SongNote(note+1,:)=[Song(end) ' ' ' ' ' '];
    Octave(note+1) = Song(end-1);
%     Timing(note+1) = Song(end-2);
end
% SongNote
for j=1:size(E,1)
    for i=1:size(SongNote,1)
        for k=1:size(W,1)
            if(sum(W(k,:)==SongNote(i,1:4))==4)
                SongNote(i,4*j+1:4*j+4) = E(mod((k-1)+(j-1),12)+1,1:4);
                if(j==1)
                    switch Octave(i)
                        case '1'  
                            play = [play voice(v,O1(k),t)];
                        case '2'  
                            play = [play voice(v,O2(k),t)]; 
                        case '3'  
                            play = [play voice(v,O3(k),t)];
                        case '4'  
                            play = [play voice(v,O4(k),t)];
                        case '5' 
                            play = [play voice(v,O5(k),t)];
                        case '6'  
                            play = [play voice(v,O6(k),t)];
                        case '7'  
                            play = [play voice(v,O7(k),t)];
                    end
                end
            end
        end
    end
end
SongNote
sound(play, 20000)
% end


