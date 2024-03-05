function sinal_reconstruido = reconstroi_sinal(sinal_recebido_binario, valor_de_pico)

    [L, ~] = size(sinal_recebido_binario);
    for k = 1:L
        palavras_codigo_recebidas = muda_tamanho(sinal_recebido_binario(k,:), 12);

        s_reconstruido = converte2decimal(palavras_codigo_recebidas);
        sinal_reconstruido(k,:) = (s_reconstruido - 2048)./2048;
    end

    sinal_reconstruido = round(sinal_reconstruido * valor_de_pico);