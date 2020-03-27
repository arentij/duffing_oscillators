function dydt = six_osc_eq(t,y)
    %% a ODE equation for a series of oscillators 
    % x_i'' + c*x_i' + k1*x_i + k1(x_i-x_i-1) + k1(x_i-x_i+1) + ...
    %       + k3(x_i-x_i-1)^3 + k3(x_i-x_i+1)^3

    global k1 k3 bodies
    % setting parameters
    c = 0.3;        % damping
    k1 = 1;         % linear spring
%     k3 = 2;        % nonlinear spring
    
    % predefine
    
    dydt = zeros(2*bodies,1);
    force = F0(t);
    % setting for every body like:
    % y1 = x1; y2 = x1'; y3 = x2; y4 = x2' ...
    for index = 1:bodies
        
        % setting the i'th coordinate
        dydt(2*index-1) = y(2*index);
        % current body index in dydt array
        curr_ind = 2*index-1;
        % next body coordinate index
        next_ind = mod( 2*index-1 + 2*bodies+2, 2*bodies);
        % previous body coordinate index
        prev_ind = mod( 2*index-1 + 2*bodies-2, 2*bodies);
        
        % setting the current body velocity
        dydt(2*index) = force  - c*y(curr_ind+1)...
                    - k1*(3*y(curr_ind)- y(prev_ind) - y(next_ind)) ...
                    - k3*(y(curr_ind))^3;
%                     - k3*( y(curr_ind) - y(prev_ind))^3 ...
%                     - k3*( y(curr_ind) - y(next_ind))^3;   
    end
end
