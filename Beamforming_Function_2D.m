close all
clear
clc

%% initialization
c = physconst('LightSpeed');
freq = 2.4e9;
lambda = c/freq;
N = 16;
M = 16;
dn = lambda/2;
dm = lambda/2;
Range_x = (-90:0.5:90);
Range_y = (-90:0.5:90);

%% setup parameters
A = ones(N,M);
Phi = zeros(N,M);

% for u = 1:64
%     A(u) = randi(10);
%     Phi(u) = randi(90);
% end

% Get the Beamforming
AF2 = getPlanebeam(A,Range_x,Range_y,lambda,Phi,dn,dm,N,M);
% load("AF3'.mat");
%% Plot
% figure(1)
% mesh(Range_x,Range_y,abs(AF3));title('Array Factor');xlabel('Angle/°');ylabel('Angle/°');zlabel('Amplitude');grid on;
% 
% AF_max = max(AF3(:));
% figure(2)
% mesh(Range_x,Range_y,20*log10(abs(AF3)/(abs(AF_max))));
% title('Array Factor-Normalized');
% xlabel('Angle/°');ylabel('Angle/°');zlabel('AF/dB');
% colorbar;
% zlim([-40 0]);
% clim([-40 0]);
% grid on;
% 
% [x,y] = meshgrid(Range_x,Range_y);
% [X,Y,Z] = sph2cart(deg2rad(x),deg2rad(y),abs(AF3));
% figure(3);
% mesh(Z,Y,X);xlabel('X');ylabel('Y');zlabel('Z');
% title('Beamforming-3D');
% xlim([-80 80]);
% ylim([-80 80]);


[~, idx_elev0] = min(abs(Range_y - 0));
AF_1D = abs(AF2(:, idx_elev0));
AF_1D_dB = 20 * log10(AF_1D / max(AF_1D) + eps);

% Plot
figure(4)
plot(Range_x, AF_1D_dB, 'b-', 'LineWidth', 1.5);
xlabel(['Angle/' char(176)]);
ylabel('AF/dB)');
legend('16*16');
title('1D Array Factor');
grid on;
ylim([-40 0]);



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

