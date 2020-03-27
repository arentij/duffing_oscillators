function E = energy_six(y)
% returns total energy of N nonlinear oscillators
global k1 k3  bodies

% bodies = 6;     % I guess N = 6 here
average_speed = 0; %sum(y(2:2:12));     
E = 0;
for index = 1:bodies
    
    % defining indecies 
    curr_ind = 2*index-1;
    next_ind = mod( 2*index-1 + 2*bodies+2, 2*bodies);
    
    % evaluate kinetic energy
    K = (y(curr_ind+1) - average_speed)^2/2;
    % linear potential energy of body-wall interaction
    U0 = k1*y(curr_ind)^2/2;
    % linear potential energy of body-body
    U1 = k1*( y(curr_ind) - y(next_ind) )^2/2;
    % nonlinear energy of body-body interaction
    U3 = k3*( y(curr_ind) )^4/4;
    % summing all of the above
    E = E + K + U0 + U1 + U3;
end

