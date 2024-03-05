%valor_snrdb = 40;
% for i = 1:5:121
% 
    A = sinal_recebido_com_hamming(i,:);
    B = sinal_recebido_sem_hamming(i,:);
    C = sinal_emg;
%     figure;
%     subplot(2,1,1);
%     plot(C - A);
%     title('SNR dB = ' + string(i/10) + ' - diff Hamming');
%     subplot(2,1,2);
%     plot(C - B);
%     title('SNR dB = ' + string(i/10) + ' - diff sem Hamming');
%     
% end


fc = 10;
fs = 2048;

[b,a] = butter(6,fc/(fs/2));
%valor_snrdb = 10;
% for valor_snrdb=1:5:120
    A = abs(fft(sinal_recebido_com_hamming(valor_snrdb,:)));
    B = abs(fft(sinal_recebido_sem_hamming(valor_snrdb,:)));
    C = abs(fft(sinal_emg));
    L = length(C)/2;

    sinal_A = filter(b,a,A(1:L));
    sinal_B = filter(b,a,B(1:L));
    sinal_C = filter(b,a,C(1:L));
    f = figure(1);
    hold on;
    plot(sinal_A,'--')
    plot(sinal_B,':')
    plot(sinal_C)
    title('SNR dB = ' + string(valor_snrdb/10));
    grid
    legend('Com Hamming','Sem Hamming', 'Original')
    saveas(f, 'imagem.png')
    hold off;
% end
% plot(C)
% grid
% legend('Com Hamming','Sem Hamming', 'Original')
% 
% 
% freq_a = freq_media(2048,A);
% freq_b = freq_media(2048,B);
% freq_c = freq_media(2048,C);
% 
% figure(2);
% hold on;
% A = abs(fft(sinal_recebido_com_hamming(valor_snrdb,:)));
% B = abs(fft(sinal_recebido_sem_hamming(valor_snrdb,:)));
% C = abs(fft(sinal_emg));
% L = length(C)/2;
% 
% plot(A(1:L))
% plot(B(1:L))
% plot(C(1:L))
% grid
% legend('Com Hamming','Sem Hamming', 'Original')
% hold off

