function f = objfun_2D(x1,x2,x3,x4,x5,x6,x7,x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48, x49, x50, x51, x52, x53, x54, x55, x56, x57, x58, x59, x60 ,x61 ,x62, x63, x64, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20, y21, y22, y23, y24, y25, y26, y27, y28, y29, y30, y31, y32, y33, y34, y35, y36, y37, y38, y39, y40, y41, y42, y43, y44, y45, y46, y47, y48, y49, y50, y51, y52, y53 ,y54 ,y55 ,y56 ,y57 ,y58, y59, y60, y61, y62, y63, y64)

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

x = [x1 x2 x3 x4 x5 x6 x7 x8; x9 x10 x11 x12 x13 x14 x15 x16; x17 x18 x19 x20 x21 x22 x23 x24; x25 x26 x27 x28 x29 x30 x31 x32; x33 x34 x35 x36 x37 x38 x39 x40; x41 x42 x43 x44 x45 x46 x47 x48; x49 x50 x51 x52 x53 x54 x55 x56; x57 x58 x59 x60 x61 x62 x63 x64];
y = [y1 y2 y3 y4 y5 y6 y7 y8; y9 y10 y11 y12 y13 y14 y15 y16; y17 y18 y19 y20 y21 y22 y23 y24; y25 y26 y27 y28 y29 y30 y31 y32; y33 y34 y35 y36 y37 y38 y39 y40; y41 y42 y43 y44 y45 y46 y47 y48; y49 y50 y51 y52 y53 y54 y55 y56; y57 y58 y59 y60 y61 y62 y63 y64];
%% setup parameters
A = ones(N,M);
Phi = zeros(N,M);

for i = 1:N
    for j = 1:M
        A(i,j) = x(i,j);
    end
end

for i = 1:N
    for j = 1:M
        Phi(i,j) = y(i,j);
    end
end


%% Get the Beamforming
AFx = getPlanebeam(A,Range_x,Range_y,lambda,Phi,dn,dm,N,M);

load('AF2.mat');
diff = AF2 - AFx;

%% Camparison
R = 0;
dif = abs(diff);
dif = dif.^2;
for m = 1:length(Range_x)
    for n = 1:length(Range_y)
        if n == 1 && m == 1
            R = dif(m,n);
        else
            R = R + dif(m,n);
        end
    end
end
R = R/length(Range_x)*length(Range_y);
R = 10*log10(R);
disp(R);

P = 0;
AFx = abs(AFx);
AFx = AFx.^2;
for k = 1:length(Range_x)
    for q = 1: length(Range_y)
        if k == 1 && q == 1
            P = AFx(1,k);
        else
            P = P + AFx(1,k);
        end
    end
end
P = P/length(Range_x)*length(Range_y);
P = 10*log10(P);
disp(P);
J = R - P;
disp(J);
f = J;

% %% Plot
% AF2_max = max(AF2(:));
% AFx_max = max(AFx(:));
% 
% figure(2)
% mesh(Range_x,Range_y,abs(AF2)/abs(AF2_max));title('Array Factor-Normalized');xlabel('Angle/°');ylabel('Angle/°');zlabel('Amplitude');grid on;
% hold on;
% mesh(Range_x,Range_y,abs(AFx)/abs(AFx_max));title('Array Factor-Normalized');xlabel('Angle/°');ylabel('Angle/°');zlabel('Amplitude');grid on;
end
