function decimais = converte2decimal(vetorBinario)
    [N,M] = size(vetorBinario);
    decimais = zeros(1, length(M));
    
    for i = 1:M
        coluna = vetorBinario(:,i)';
        coluna = join(string(coluna),'');
        decimais(i) = bin2dec(coluna);
    end
end