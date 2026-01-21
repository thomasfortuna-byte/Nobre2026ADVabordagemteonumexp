%% ===============================
%  DADOS COMUNS – EXPERIMENTAL
%% ===============================
l = [170 190 210 240 280 320 360]; % Comprimentos (mm)
k1 = [3411 2432 2009 1301 885 588 412]; % Rigidez experimental (N/m)

red_print = [0.8500 0.3250 0.0980];

%% ===============================
%  GRÁFICO – RIGIDEZ × COMPRIMENTO
%% ===============================
figure;

plot(l, k1, 'o', ...
    'LineWidth', 1.8, ...
    'MarkerSize', 8, ...
    'MarkerFaceColor', red_print, ...
    'MarkerEdgeColor', red_print);

xlabel(' l [mm]', 'FontSize', 12);
ylabel('k_1 [N/m]', 'FontSize', 12);
title('', 'FontSize', 14);

grid on;
set(gca, 'FontSize', 12);

% Offset automático e limite correto do eixo Y
offset = 0.06 * k1;
ylim([0 max(k1 + offset) * 1.05]);

% Rótulos numéricos (sem corte)
for i = 1:length(l)
    text(l(i), k1(i) + offset(i), sprintf('%.0f', k1(i)), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom', ...
        'FontSize', 10, ...
        'Color', 'k');
end

% Tamanho fixo e salvamento em alta resolução
set(gcf, 'Units', 'centimeters');
set(gcf, 'Position', [5 5 16 12]);

exportgraphics(gcf, 'Figura 22a.png', ...
    'Resolution', 600);
%% ===============================
figure;

plot(l, wn, 'o', ...
    'LineWidth', 1.8, ...
    'MarkerSize', 8, ...
    'MarkerFaceColor', red_print, ...
    'MarkerEdgeColor', red_print);

xlabel('l [mm]', 'FontSize', 12);
ylabel('\omega_n [rad/s]', 'FontSize', 12);
title('', 'FontSize', 14);

grid on;
set(gca, 'FontSize', 12);

% Folga no eixo Y
ylim([0 max(wn)*1.25]);

for i = 1:length(l)
    offset = 0.05*wn(i);
    text(l(i), wn(i) + offset, sprintf('%.2f', wn(i)), ...
        'HorizontalAlignment', 'center', ...
        'FontSize', 10, ...
        'Color', 'k');
end

% Tamanho fixo
set(gcf, 'Units', 'centimeters');
set(gcf, 'Position', [5 5 16 12]);

% Salvamento correto
exportgraphics(gcf, 'Figura 22b.png', ...
    'Resolution', 600);
