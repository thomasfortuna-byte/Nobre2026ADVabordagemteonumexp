%% Steady-State Vibration of a Spring-Mass-Damper System
% This script computes and plots the normalized amplitude ratio (M) 
% as a function of the frequency ratio (r) and damping ratio (zeta).

%% Inputs
r = linspace(0, 2, 100); % Frequency ratio: ω/ω_n
zeta = linspace(0.05, 0.5, 100); % Damping ratio

%% Create Meshgrid
[X, Y] = meshgrid(r, zeta); % X corresponds to frequency ratio, Y to damping ratio

%% Compute Amplitude Ratio (M)
M = 1 ./ sqrt((1 - X.^2).^2 + (2 .* Y .* X).^2);

%% 3D Surface and Contour Plot
figure;
surfc(X, Y, M); % Surface plot with contour projection
colorbar; % Add colorbar
title('', 'FontSize', 12);
xlabel('r = \omega / \omega_n', 'FontSize', 12);
ylabel('\zeta', 'FontSize', 12);
zlabel('X_1 / F_0', 'Interpreter', 'tex', 'FontSize', 12);
grid on;

%% Mesh and Contour Plot
figure;
meshc(X, Y, M); % Mesh plot with contour projection
colorbar; % Add colorbar
title('', 'FontSize', 12);
xlabel(' r = \omega / \omega_n', 'FontSize', 12);
ylabel('\zeta', 'FontSize', 12);
zlabel('X_1 / F_0', 'Interpreter', 'tex', 'FontSize', 12);
grid on;

%% 2D Contour Plot
figure;
contourf(X, Y, M, 40); % Filled contour plot with 40 levels
colorbar; % Add colorbar
title('', 'FontSize', 12);
xlabel(' r = \omega / \omega_n', 'FontSize', 12);
ylabel('\zeta', 'FontSize', 12);
grid on;

%% Discussion
disp([' ' ...
    ' ' ...
    ' ' ...
    '']);

%% =========================================================
% SALVAMENTO AUTOMÁTICO EM JPEG – ALTA QUALIDADE
%% =========================================================

nome_base = mfilename;                 % Nome do arquivo .m
figs = findall(0, 'Type', 'figure');   % Todas as figuras abertas
sufixos = 'abcdefghijklmnopqrstuvwxyz';

for i = 1:length(figs)
    
    fig = figs(i);
    figure(fig); %#ok<LFIG>
    
    % Ajuste de tamanho (boa resolução visual)
    set(fig, 'Units', 'centimeters');
    set(fig, 'Position', [5 5 16 12]);
    
    % Nome com sufixo a, b, c, ...
    nome_fig = sprintf('%s%c.jpeg', nome_base, sufixos(i));
    
    % Salvar em JPEG com alta qualidade
    print(fig, nome_fig, '-djpeg', '-r600');   % 600 dpi
end
