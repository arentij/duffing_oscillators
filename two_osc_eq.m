function dydt = two_osc_eq(t,y)
    c = 0.03;
    k1 = 3;
    k3 = 1;

    dydt = [y(2); F0(t) - c*y(2)-k1*y(1)-k3*y(1)^3];  
%    dydt = [y(2); F0(t) - c*y(2)-k1*y(1)-k3*y(1)^3];  
end
