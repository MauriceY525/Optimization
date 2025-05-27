%% Function of AF
function AF = getBeam(A, Theta, lambda, Phi, d, N)

AF = 0;             % initialization
for n = 1:N
    AF = AF + A(n)*exp(-1*sqrt(-1)*(deg2rad(Phi(n))+(2*pi*d*n*sin(deg2rad(Theta))/lambda)));
end

end