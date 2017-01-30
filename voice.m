
function playadd = voice(v,k,t)
    switch v
        case 1
            playadd = sin(2*pi*k*(0:1/20000:t));
        case 2
            playadd = square(2*pi*k*(0:1/20000:t));
        case 3
            playadd = sawtooth(2*pi*k*(0:1/20000:t));
        case 4
            playadd = sin(2*pi*k*(0:1/20000:t))+sawtooth(2*pi*k*(0:1/20000:t));
        case 5
            playadd = sin(2*pi*k*(0:1/20000:t)) + cos(2*pi*k*(0:1/20000:t));
        case 6
            playadd = chirp(2*pi*k*(0:1/20000:t)) ;
        case 7
            playadd = sawtooth(2*pi*k*(0:1/20000:t)).*sin(2*pi*k*(0:1/20000:t))+ square(2*pi*k*(0:1/20000:t));
    end
end