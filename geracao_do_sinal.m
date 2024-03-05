clear; clc; close all;
% criação sinal aleatorio
[b,a] = butter(5,[20 500]/1500);
sinal = filter(b,a,randn(1,1000));

subplot(2,1,1)
plot(sinal(1:200))
xlabel('Tempo (ms)');
ylabel(' Tensão (mV)');
title('Sinal de Entrada Continuo', 'lineWidth', 5)
% 
% subplot(3,2,2)
% plot(abs(fft(sinal)));
% xlabel('Frequência (Hz)');
% ylabel(' Amplitude');
% title('Espectro de frequência', 'lineWidth', 5)

% Amostragem
p(1:length(sinal)) = 0;
fs = 1500;
Ts = 1/fs;
p(1:Ts:end) = 1;
p = p(1:length(sinal));

sinal_amostrado = sinal.*p;
sinal_amostrado = sinal_amostrado/max(abs(sinal_amostrado)); % normalização do valores entre -1 e 1

% subplot(3,2,3)
% stem(sinal_amostrado(1:200))
% xlabel('Amostras (n)');
% ylabel(' Tensão (mV)');
% title('Sinal de Entrada Discreto', 'lineWidth', 5)
% 
% subplot(3,2,4)
% plot(abs(fft(sinal_amostrado)));
% xlabel('Frequência (Hz)');
% ylabel(' Amplitude');
% title('Espectro de frequência', 'lineWidth', 5)


% Divide a amplitude do sinal em 4096 intervalos
x = uencode(sinal_amostrado, 12, 1, 'Signed');

% Fazer o calculo de MNF e MDF


% Somando 2048 para que todos os valores fiquem positivos
x_quantizado = x + 2048;

subplot(2,1,2)
stem(x(1:200));
xlabel('Amostras (n)');
ylabel(' Amplitude');
title('Sinal Amostrado e Quantizado', 'lineWidth', 5)

fonte_de_simbolos = converte2binario(x_quantizado);

% Codificação de canal
[palavras_codigo, G, H] = codificacao(fonte_de_simbolos);






