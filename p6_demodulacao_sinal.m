% Demodulação do sinal

[q_err_antes_decod,taxa_erro_bit_antes_decod,sinal_hamming_demodulado] = demodulador(sinal_ruidoso_recebido_codificado,onda_carregadora,s_codificado); % codificado
[q_err_sem_hamming,taxa_erro_bit_sem_hamming,sinal_sem_hamming_demodulado] = demodulador(sinal_ruidoso_recebido_nao_codificado,onda_carregadora,s_nao_codificado); % não codificado

function [qtd_erros, ber_experimental, bits_recuperados] = demodulador(sinais_recebidos,onda_carregadora,bits_enviados)
    [qtd_sinais_recebidos, tamanho_sinal_recebido] = size(sinais_recebidos);

    tamanho_periodo = length(onda_carregadora);
    qtd_bits = double(tamanho_sinal_recebido / tamanho_periodo);

    bits_recuperados = zeros(qtd_sinais_recebidos, int32(qtd_bits));

    for i = 1:qtd_sinais_recebidos
        sinal_recebido = sinais_recebidos(i,:);

        for j = 1:qtd_bits
            resultado = dot(sinal_recebido(1+(j-1)*tamanho_periodo:tamanho_periodo+(j-1)*tamanho_periodo), onda_carregadora);
            if resultado < 0
                bits_recuperados(i,j) = 0;
            else
                bits_recuperados(i,j) = 1;
            end
        end

        qtd_erros(i) = nnz(bits_recuperados(i,:) - bits_enviados);

    end

    ber_experimental(:) = qtd_erros(:)/qtd_bits;
end
