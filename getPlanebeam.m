function AF = getPlanebeam(A, Range_x, Range_y, lambda, Phi, dn, dm, N, M)

AF = zeros(length(Range_x),length(Range_y));             % initialization
for q = 1:length(Range_x)
    for w = 1:length(Range_y)
        for n = 1:N
            for m = 1:M
                AF(q,w) = AF(q,w) + A(n,m)*(exp(-1*sqrt(-1)*(Phi(n,m)+ 2*pi*dn*cos(deg2rad(Range_y(w)))*sin(deg2rad(Range_x(q)))*n/lambda + 2*pi*dm*sin(deg2rad(Range_y(w)))*m/lambda)));
            end
        end
    end
end
end