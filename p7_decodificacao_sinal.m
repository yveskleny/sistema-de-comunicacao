% Decodificação do sinal
[q_err_decod_identificados, err_restantes_pos_decod, sinal_hamming_recuperado] = decodificacao(sinal_hamming_demodulado, H, sinal_binario);

sinal_recebido_com_hamming = reconstroi_sinal(sinal_hamming_recuperado, valor_de_pico);
sinal_recebido_sem_hamming = reconstroi_sinal(sinal_sem_hamming_demodulado, valor_de_pico);

clear valor_de_pico onda_carregadora onda_carregadora_final

function [qtd_erros_identificados, qtd_erros_total, r_decodificado] = decodificacao(r, H, sinal_binario)

    [N, M] = size(r);
    tamanho_palavra_codigo = 7;
    
    for k = 1:N
       R = r(k, :); 
       R(real(R) == -1) = 0;
       R(real(R) == 1) = 1;
       qtd_palavras_codigo = length(R)/tamanho_palavra_codigo;
       
       R = muda_tamanho(R, tamanho_palavra_codigo);
       
       R_decodificado = zeros(4,qtd_palavras_codigo);
       qtd_erros_identificados(k) = 0;
       qtd_erros_total(k) = 0;
       for i = 1:qtd_palavras_codigo
           palavra_recebida = R(:,i)';
           sindrome = mod(palavra_recebida*H', 2);
           
           if sindrome == false
               R_decodificado(:,i) = palavra_recebida(4:tamanho_palavra_codigo)';
           else
               qtd_erros_identificados(k) = qtd_erros_identificados(k) + 1;
               palavra_corrigida = correcao_erro(sindrome, H, palavra_recebida);
               R_decodificado(:,i) = palavra_corrigida(4:tamanho_palavra_codigo)';
           end
           
       end
       
       r_decodificado(k,:) = muda_tamanho(R_decodificado,1);
       qtd_erros_total(k) = nnz(r_decodificado(k,:) - sinal_binario);
    end
end

function palavra_codigo_corrigida = correcao_erro(sindrome, H, palavra_codigo_recebida)
    indice_erro = find(ismember(H', sindrome,"rows"));
    
    correcao = zeros(1,length(palavra_codigo_recebida));
    correcao(indice_erro) = 1;
    
    palavra_codigo_corrigida = mod(palavra_codigo_recebida + correcao,2);
end

