function getColordiagram1D(save_x,save_y)

N = 8;

Image_matrix_A = zeros(N,1);
Image_matrix_Phi = zeros(N,1);


for i = 1:N
        Image_matrix_A(i) = save_x(i);
end

for i = 1:N
        Image_matrix_Phi(i) = save_y(i);
end


figure(1)
imagesc(Image_matrix_A);
colormap jet;
clim([0 1]);
colorbar;
title('Amplitude Optimization')
xlabel('# of Antenna');
ylabel('# of Antenna');
for s = 1:N
        Val_A = Image_matrix_A(s);
        Val_Phi = Image_matrix_Phi(s);
        str = sprintf('%d\n%.2f%°',Val_A, Val_Phi);
        text(1, s , str, ...
            'HorizontalAlignment', 'center', ...
            'FontSize', 8, ...
            'FontWeight', 'bold', ...
            'Color', 'white');
end

figure(2)
imagesc(Image_matrix_Phi);
colormap jet;
clim([-90 90]);
colorbar;

% axis image;
title('Phase Optimization')
xlabel('# of Antenna');
ylabel('# of Antenna');
for s = 1:N
        Val_A = Image_matrix_A(s);
        Val_Phi = Image_matrix_Phi(s);
        str = sprintf('%d\n%.2f%°',Val_A, Val_Phi);
        text(1, s, str, ...
            'HorizontalAlignment', 'center', ...
            'FontSize', 8, ...
            'FontWeight', 'bold', ...
            'Color', 'white');
end
end