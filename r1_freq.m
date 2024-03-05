fc = 10;
fs = 2048;

[b,a] = butter(6,fc/(fs/2));
%valor_snrdb = 10;

mkdir imagens_freq
for valor_snrdb=1:2:121
    A = abs(fft(sinal_recebido_com_hamming(valor_snrdb,:)));
    B = abs(fft(sinal_recebido_sem_hamming(valor_snrdb,:)));
    C = abs(fft(sinal_emg));
    L = length(C)/2;

    sinal_A = filter(b,a,A(1:L));
    sinal_B = filter(b,a,B(1:L));
    sinal_C = filter(b,a,C(1:L));
    figure;
    hold on;
    plot(sinal_A,'--')
    plot(sinal_B,':')
    plot(sinal_C)
    title('SNR dB = ' + string(valor_snrdb/10));
    grid
    legend('Com Hamming','Sem Hamming', 'Original')
    f_name = 'C:\Users\yvesk\OneDrive\Desktop\TCC2\codigo_tcc\imagens_freq';
    saveas(gcf,fullfile(f_name,string(valor_snrdb)),'png');
    hold off;
end