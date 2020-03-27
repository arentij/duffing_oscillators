grid = 10;

x0 = linspace(-4,4,grid);
Dx0 = linspace(-4,4,grid);

amplitude_space = zeros(grid,grid);

for x_index = 1:grid
    for Dx_index = 1:grid

        w = 2;
        c = 0.03;
        k1 = 3;
        k3 = 1;
        F0 = @(t) (1*sin(w*t));

        F = @(t,y) [y(2); F0(t) - c*y(2)-k1*y(1)-k3*y(1)^3];
        y0 = [x0(x_index); Dx0(Dx_index)];

        time = linspace(0,400,steps);
        [t,y] = ode45(F, time, y0);
        
        amplitude = max( abs(y(end-300:end,1)));
        amplitude_space(x_index,Dx_index) = amplitude;
    end
end

imagesc(amplitude_space)