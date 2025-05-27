close all
clear
clc

%% initialization
c = physconst('LightSpeed');
freq = 2.4e9;
lambda = c/freq;
N = 8;
d = lambda/2;
Ns = 500;

%% setup parameters
A = ones(1,N);
% Phi = zeros(1,N);
Phi = [-90,45,85,90,87,62,77,33];
Theta = linspace(-90,90,Ns);

%% Get the Beamforming
AF1 = getBeam(A,Theta,lambda,Phi,d,N);

%% Plot
% 1D view - normalized
AF_max = max(AF1);
figure(1)
plot(Theta, abs(AF1)/abs(AF_max), 'r');

% 3D view
fov_ele = (-90:1:90);
AF3D = repmat(AF1,length(fov_ele),1);
[x,y]   = meshgrid(Theta,fov_ele);
[X,Y,Z] = sph2cart(deg2rad(x),deg2rad(y),abs(AF3D));

figure(2);
surf(Z,Y,X);title('Beamforming-3D');
xlabel('X');
ylabel('Y');
zlabel('Z'); 
xlim([-30 30]); ylim([-6 3]);  % range of axis

% Polar
figure(3);
x = Theta.*pi./180;
polarplot(x,abs(AF1));
title('Beamforming in Polar');


%% Function of AF
function AF = getBeam(A, Theta, lambda, Phi, d, N)

AF = 0;             % initialization
for n = 1:N
    AF = AF + A(n)*exp(-1*sqrt(-1)*(deg2rad(Phi(n))+(2*pi*d*n*sin(deg2rad(Theta))/lambda)));
end

end