function f = objfun_1D_3(x1,x2,x3,x4,x5,x6,x7,x8,y1,y2,y3,y4,y5,y6,y7,y8)

%% initialization
c = physconst('LightSpeed');
freq = 2.4e9;
lambda = c/freq;
N = 8;
d = lambda/2;
Ns = 500;

%% setup parameters
A = [x1,x2,x3,x4,x5,x6,x7,x8];
Phi = [y1,y2,y3,y4,y5,y6,y7,y8];
Theta = linspace(-90,90,Ns);

%% Get the Beamforming
AFx = getBeam(A,Theta,lambda,Phi,d,N);
load('AF1.mat');
diff = AF1 - AFx;

%% Camparison
R = 0;
dif = abs(diff);
dif = dif.^2;
for n = 1:Ns
    if n == 1
        R = dif(1,n);
    else
        R = R + dif(1,n);
    end
end
R = R/Ns;
R = 10*log10(R);
disp(R);

P = 0;
AFx = abs(AF1);
AFx = AFx.^2;
for k = 1:Ns
    if k == 1
        P = AFx(1,k);
    else
        P = P + AFx(1,k);
    end
end
P = P/Ns;
P = 10*log10(P);
disp(AFx);
J = R - P;
disp(J);
f = J;
end
