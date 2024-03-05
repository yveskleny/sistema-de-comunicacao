clear; clc; close all;

% coleta da amostra de sinal de EMG
emg = emg_16_extract('SM_1_S8.SIG');
t_segundos = 1; % tempo em segundos em que as amostras foram coletadas
janela = 2048; % 2048 amostras = 1 segundo
canal = 1; % canal escolhido
sinal_emg = emg(canal,1+(t_segundos-1)*janela:janela+(t_segundos-1)*janela);

clear emg t_segundos janela

%plot(sinal_emg);

p2_pre_processamento;
p3_codificacao_de_canal;
p4_modulacao;
p5_canal_ruidoso;
p6_demodulacao_sinal;
p7_decodificacao_sinal;