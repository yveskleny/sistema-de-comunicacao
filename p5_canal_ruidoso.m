Eb = length(onda_carregadora)/2; %  

SNR_dB = 0:0.1:20;

ruido1 = randn(1,length(s1_modulado));
ruido2 = randn(1,length(s2_modulado));

for k = 1:length(SNR_dB)
   SNR(k) = 10.^(SNR_dB(k)/10);
   sigma2_a = Eb/(2*(4/7)*(SNR(k)));
   sigma2_b = Eb/(2*SNR(k));
   
   sinal_ruidoso_recebido_codificado(k,:) = s1_modulado + sqrt(sigma2_a)*ruido1; % codificado
   sinal_ruidoso_recebido_nao_codificado(k,:) = s2_modulado + sqrt(sigma2_b)*ruido2; % não codificado
   
end

clear Eb k ruido1 ruido2 sigma2_a sigma2_b 