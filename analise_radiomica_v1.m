% Simulação de um corte de RM (Matriz 3x3)
matriz_imagem = [0.1, 0.5, 0.2; 0.9, 0.8, 0.1; 0.3, 0.2, 0.6];

% Aplicando limiar (threshold) para segmentar o tumor
mascara_tumor = matriz_imagem > 0.5;

% Calculando a intensidade média do tumor segmentado
intensidade_media = mean(matriz_imagem(mascara_tumor));
% Adicionando visualização (Plotagem)
figure; % Abre uma nova janela de figura
subplot(1,2,1); imagesc(matriz_imagem); title('RM Original'); colorbar;
subplot(1,2,2); imagesc(mascara_tumor); title('Segmentação (Tumor)'); colorbar;
saveas(gcf, 'Resultado_Segmentacao.png');