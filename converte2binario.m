function vetor_binario = converte2binario(amostras, bits_resolucao)
    N = length(amostras);
    vetor_binario = zeros(bits_resolucao, N);
    for i = 1:N
        string_binaria = dec2bin(amostras(i),bits_resolucao);
        vetor_binario(:,i) = str2num(string_binaria(:));
    end
    
    vetor_binario = logical(muda_tamanho(vetor_binario, 1));
end