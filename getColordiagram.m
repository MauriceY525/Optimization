function getColordiagram(save_x,save_y)

N = 8;
M = 8;

Image_matrix_A = zeros(N,M);
Image_matrix_Phi = zeros(N,M);


for i = 1:N
    for j = 1:M
        Image_matrix_A(i,j) = save_x(i,j);
    end
end

for i = 1:N
    for j = 1:M
        Image_matrix_Phi(i,j) = save_y(i,j);
    end
end


figure(1)
imagesc(Image_matrix_A);
colormap summer;
clim([0 1]);
colorbar;
title('Amplitude Optimization')
for s = 1:N
    for q = 1:M
        Val_A = Image_matrix_A(s,q);
        Val_Phi = Image_matrix_Phi(s,q);
        str = sprintf('%d\n%.2f%°',Val_A, Val_Phi);
        text(s, q, str, ...
            'HorizontalAlignment', 'center', ...
            'FontSize', 8, ...
            'FontWeight', 'bold', ...
            'Color', 'white');
    end
end

figure(2)
imagesc(Image_matrix_Phi);
colormap winter;
clim([-90 90]);
colorbar;

% axis image;
title('Phase Optimization')

for s = 1:N
    for q = 1:M
        Val_A = Image_matrix_A(s,q);
        Val_Phi = Image_matrix_Phi(s,q);
        str = sprintf('%d\n%.2f%°',Val_A, Val_Phi);
        text(s, q, str, ...
            'HorizontalAlignment', 'center', ...
            'FontSize', 8, ...
            'FontWeight', 'bold', ...
            'Color', 'white');
    end
end
end