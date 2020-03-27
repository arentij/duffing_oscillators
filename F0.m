function f = F0(t)
    % returns oscilating force on [-1 1] 
    % global w (frequency should be defined
    global w;
    f = (1*cos(w*t))+0.5*randn();
%     f = (1*cos(w*t));
end

