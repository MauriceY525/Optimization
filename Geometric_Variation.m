c = 3e8;
fc = 2.4e9;
lambda = c / fc;
angles = -90:0.1:90;
d = lambda / 2;

array_sizes = [16, 16, 16, 16];
steering_angles = [-25, -10, 10, 25];
colors = {'b', 'r', 'g', 'm'};

figure;
hold on;
for i = 1:length(array_sizes)
    N = array_sizes(i);
    theta_0 = steering_angles(i);
    n = 0:N-1;
    af = zeros(size(angles));
    for k = 1:length(angles)
        phase = 2*pi*d/lambda * n * sind(angles(k));
        af(k) = abs(sum(exp(1j * phase) .* exp(-1j * 2*pi*d/lambda * n * sind(theta_0))));
    end
    af_dB = 20*log10(af / max(af) + eps);
    plot(angles, af_dB, 'Color', colors{i}, 'LineWidth', 2, 'DisplayName', sprintf('%dx%d, \\theta_0=%d°', N, N, theta_0));
end
xlabel(['Angle' char(176)]);
ylabel('AF (dB)');
ylim([-40 0]);
xlim([-90 90]);
grid on;
legend('show');
title('Side-Lobe Geometric Variation');
