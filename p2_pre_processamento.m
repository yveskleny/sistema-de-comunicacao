clc; close all;

% armazenar o valor de pico
valor_de_pico = max(abs(sinal_emg));

% normalizacao do sinal utilizando o valor de pico
sinal_normalizado = sinal_emg/valor_de_pico;

% quantizacao do sinal utilizando 12 bits de resolucao
sinal_12bits = double(uencode(sinal_normalizado, 12, 1, 'Signed'));

% calculo do erro inserido no sinal devido a quantização
erro_normalizacao = abs(sinal_normalizado - (double(sinal_12bits))/2^11);
erro_normalizacao = (erro_normalizacao*valor_de_pico);

% plot(amostra_sinal_normalizada)
% figure;
% plot(double(amostra_sinal_12bits)/2^11)

% somando 2048 a todas as amostras do sinal eliminando valores negativos
deslocamento = 2^11;
sinal_12bits_deslocado = sinal_12bits + deslocamento;

% conversao das amostras de decimal para binario
sinal_binario = converte2binario(sinal_12bits_deslocado,12);


clear deslocamento sinal_12bits sinal_12bits_deslocado sinal_normalizado erro_normalizacao
