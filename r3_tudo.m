fc = 10;
fs = 2048;

[b,a] = butter(6,fc/(fs/2));
%valor_snrdb = 10;

mkdir imagens
for valor_snrdb=1:2:121
    a = sinal_recebido_com_hamming(valor_snrdb,:);
    b = sinal_recebido_sem_hamming(valor_snrdb,:);
    c = sinal_emg;
    
    A = abs(fft(a));
    B = abs(fft(b));
    C = abs(fft(c));
    L = length(c)/2;
    
    sinal_A = filter(b,a,A(1:L));
    sinal_B = filter(b,a,B(1:L));
    sinal_C = filter(b,a,C(1:L));
    
    figure;
    
    subplot(2,3,1);
    plot(c - a);
    title('SNR dB = ' + string(valor_snrdb/10) + 'Ruido Residual - Hamming');
    
    subplot(2,3,2);
    plot(c - b);
    title('SNR dB = ' + string(valor_snrdb/10) + 'Ruido Residual - Sem Hamming');
    
    subplot(2,3,[2 3 5 6])
    hold on;
    plot(sinal_A,'--')
    plot(sinal_B,':')
    plot(sinal_C)
    title('SNR dB = ' + string(valor_snrdb/10));
    hold off;
    legend('Com Hamming','Sem Hamming', 'Original')
    
    f_name = 'C:\Users\yvesk\OneDrive\Desktop\TCC2\codigo_tcc\imagens';
    saveas(gcf,fullfile(f_name,string(valor_snrdb)),'png');
end