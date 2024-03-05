function saida = muda_tamanho(entrada, k)
    [n, m] = size(entrada);
    saida = reshape(entrada, [k, n*m/k]);
end