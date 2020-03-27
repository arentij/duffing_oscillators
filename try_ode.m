w_array = 0.05:0.05:3;
steps = 9500;
amplitude_matrix = zeros(steps,size(w_array,2));
amplitude_max = zeros(1,size(w_array,2));

for w_index = 1:length(w_array)
    
    w = w_array(w_index);
    c = 0.3;
    k1 = 1;
    k3 = 1;
    F0 = @(t) (1*cos(w*t));

    F = @(t,y) [y(2); F0(t) - c*y(2)-k1*y(1)-k3*y(1)^3];
    y0 = [0; 0];
    
    time = linspace(0,400,steps);
    [t,y] = ode45(F, time, y0);

    amplitude_matrix(1:size(y,1),w_index) = y(:,1);
    amplitude_max(1,w_index) = max(abs(y(:,1)));
end
figure(1)
imagesc(abs(amplitude_matrix'))
figure(2)
plot(w_array, amplitude_max);
