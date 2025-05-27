close all
clear
clc

%% initialization
c = physconst('LightSpeed');
freq = 2.4e9;
lambda = c/freq;
N = 8;
M = 8;
dn = lambda/2;
dm = lambda/2;
Range_x = (-90:1:90);
Range_y = (-90:1:90);

%% setup parameters
A = ones(N,M);
Phi = zeros(N,M);

% for u = 1:64
%     A(u) = rand;
%     Phi(u) = randi(90);
% end
 
%% Get the Beamforming
AF2 = getPlanebeam(A,Range_x,Range_y,lambda,Phi,dn,dm,N,M);

%% Plot
figure(1)
mesh(Range_x,Range_y,abs(AF2));title('Array Factor');xlabel('Angle/°');ylabel('Angle/°');zlabel('Amplitude');grid on;

AF_max = max(AF2(:));
figure(2)
mesh(Range_x,Range_y,abs(AF2)/abs(AF_max));title('Array Factor-Normalized');xlabel('Angle/°');ylabel('Angle/°');zlabel('Amplitude');grid on;

[x,y] = meshgrid(Range_x,Range_y);
[X,Y,Z] = sph2cart(deg2rad(x),deg2rad(y),abs(AF2));
figure(3);
mesh(Z,Y,X);xlabel('X');ylabel('Y');zlabel('Z');title('Beamforming-3D');
xlim([-80 80]);ylim([-80 80]);


%% Function of AF (qwer)
function AF = getPlanebeam(A, Range_x, Range_z, lambda, Phi, dn, dm, N, M)

AF = zeros(length(Range_x),length(Range_z));             % initialization
for q = 1:length(Range_x)
    for w = 1:length(Range_z)
        for n = 1:N
            for m = 1:M
                AF(q,w) = AF(q,w) + A(n,m)*(exp(-1*sqrt(-1)*(Phi(n,m)+ 2*pi*dn*cos(deg2rad(Range_z(w)))*sin(deg2rad(Range_x(q)))*n/lambda + 2*pi*dm*sin(deg2rad(Range_z(w)))*m/lambda)));
            end
        end
    end
end
end

