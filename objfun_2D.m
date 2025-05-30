function f = objfun_2D(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127,x128,x129,x130,x131,x132,x133,x134,x135,x136,x137,x138,x139,x140,x141,x142,x143,x144,x145,x146,x147,x148,x149,x150,x151,x152,x153,x154,x155,x156,x157,x158,x159,x160,x161,x162,x163,x164,x165,x166,x167,x168,x169,x170,x171,x172,x173,x174,x175,x176,x177,x178,x179,x180,x181,x182,x183,x184,x185,x186,x187,x188,x189,x190,x191,x192,x193,x194,x195,x196,x197,x198,x199,x200,x201,x202,x203,x204,x205,x206,x207,x208,x209,x210,x211,x212,x213,x214,x215,x216,x217,x218,x219,x220,x221,x222,x223,x224,x225,x226,x227,x228,x229,x230,x231,x232,x233,x234,x235,x236,x237,x238,x239,x240,x241,x242,x243,x244,x245,x246,x247,x248,x249,x250,x251,x252,x253,x254,x255,x256,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27,y28,y29,y30,y31,y32,y33,y34,y35,y36,y37,y38,y39,y40,y41,y42,y43,y44,y45,y46,y47,y48,y49,y50,y51,y52,y53,y54,y55,y56,y57,y58,y59,y60,y61,y62,y63,y64,y65,y66,y67,y68,y69,y70,y71,y72,y73,y74,y75,y76,y77,y78,y79,y80,y81,y82,y83,y84,y85,y86,y87,y88,y89,y90,y91,y92,y93,y94,y95,y96,y97,y98,y99,y100,y101,y102,y103,y104,y105,y106,y107,y108,y109,y110,y111,y112,y113,y114,y115,y116,y117,y118,y119,y120,y121,y122,y123,y124,y125,y126,y127,y128,y129,y130,y131,y132,y133,y134,y135,y136,y137,y138,y139,y140,y141,y142,y143,y144,y145,y146,y147,y148,y149,y150,y151,y152,y153,y154,y155,y156,y157,y158,y159,y160,y161,y162,y163,y164,y165,y166,y167,y168,y169,y170,y171,y172,y173,y174,y175,y176,y177,y178,y179,y180,y181,y182,y183,y184,y185,y186,y187,y188,y189,y190,y191,y192,y193,y194,y195,y196,y197,y198,y199,y200,y201,y202,y203,y204,y205,y206,y207,y208,y209,y210,y211,y212,y213,y214,y215,y216,y217,y218,y219,y220,y221,y222,y223,y224,y225,y226,y227,y228,y229,y230,y231,y232,y233,y234,y235,y236,y237,y238,y239,y240,y241,y242,y243,y244,y245,y246,y247,y248,y249,y250,y251,y252,y253,y254,y255,y256)

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

x = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16;
 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32;
 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42 x43 x44 x45 x46 x47 x48;
 x49 x50 x51 x52 x53 x54 x55 x56 x57 x58 x59 x60 x61 x62 x63 x64;
 x65 x66 x67 x68 x69 x70 x71 x72 x73 x74 x75 x76 x77 x78 x79 x80;
 x81 x82 x83 x84 x85 x86 x87 x88 x89 x90 x91 x92 x93 x94 x95 x96;
 x97 x98 x99 x100 x101 x102 x103 x104 x105 x106 x107 x108 x109 x110 x111 x112;
 x113 x114 x115 x116 x117 x118 x119 x120 x121 x122 x123 x124 x125 x126 x127 x128;
 x129 x130 x131 x132 x133 x134 x135 x136 x137 x138 x139 x140 x141 x142 x143 x144;
 x145 x146 x147 x148 x149 x150 x151 x152 x153 x154 x155 x156 x157 x158 x159 x160;
 x161 x162 x163 x164 x165 x166 x167 x168 x169 x170 x171 x172 x173 x174 x175 x176;
 x177 x178 x179 x180 x181 x182 x183 x184 x185 x186 x187 x188 x189 x190 x191 x192;
 x193 x194 x195 x196 x197 x198 x199 x200 x201 x202 x203 x204 x205 x206 x207 x208;
 x209 x210 x211 x212 x213 x214 x215 x216 x217 x218 x219 x220 x221 x222 x223 x224;
 x225 x226 x227 x228 x229 x230 x231 x232 x233 x234 x235 x236 x237 x238 x239 x240;
 x241 x242 x243 x244 x245 x246 x247 x248 x249 x250 x251 x252 x253 x254 x255 x256];
y = [x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16;
 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32;
 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42 x43 x44 x45 x46 x47 x48;
 x49 x50 x51 x52 x53 x54 x55 x56 x57 x58 x59 x60 x61 x62 x63 x64;
 x65 x66 x67 x68 x69 x70 x71 x72 x73 x74 x75 x76 x77 x78 x79 x80;
 x81 x82 x83 x84 x85 x86 x87 x88 x89 x90 x91 x92 x93 x94 x95 x96;
 x97 x98 x99 x100 x101 x102 x103 x104 x105 x106 x107 x108 x109 x110 x111 x112;
 x113 x114 x115 x116 x117 x118 x119 x120 x121 x122 x123 x124 x125 x126 x127 x128;
 x129 x130 x131 x132 x133 x134 x135 x136 x137 x138 x139 x140 x141 x142 x143 x144;
 x145 x146 x147 x148 x149 x150 x151 x152 x153 x154 x155 x156 x157 x158 x159 x160;
 x161 x162 x163 x164 x165 x166 x167 x168 x169 x170 x171 x172 x173 x174 x175 x176;
 x177 x178 x179 x180 x181 x182 x183 x184 x185 x186 x187 x188 x189 x190 x191 x192;
 x193 x194 x195 x196 x197 x198 x199 x200 x201 x202 x203 x204 x205 x206 x207 x208;
 x209 x210 x211 x212 x213 x214 x215 x216 x217 x218 x219 x220 x221 x222 x223 x224;
 x225 x226 x227 x228 x229 x230 x231 x232 x233 x234 x235 x236 x237 x238 x239 x240;
 x241 x242 x243 x244 x245 x246 x247 x248 x249 x250 x251 x252 x253 x254 x255 x256];
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
