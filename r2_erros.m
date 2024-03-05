valor_snrdb = 40;
mkdir imagens_diff_sinal

for valor_snrdb = 1:2:121

    A = sinal_recebido_com_hamming(valor_snrdb,:);
    B = sinal_recebido_sem_hamming(valor_snrdb,:);
    C = sinal_emg;
    figure;
    subplot(2,1,1);
    plot(C - A);
    title('SNR dB = ' + string(valor_snrdb/10) + 'Ruido Residual - Hamming');
    subplot(2,1,2);
    plot(C - B);
    title('SNR dB = ' + string(valor_snrdb/10) + 'Ruido Residual - Sem Hamming');
    
    f_name = 'C:\Users\yvesk\OneDrive\Desktop\TCC2\codigo_tcc\imagens_diff_sinal';
    saveas(gcf,fullfile(f_name,string(valor_snrdb)),'png');
    close;
    
end