% sinal com a redundancia do codigo de Hamming
[s_codificado, H] = codificacao_de_hamming(sinal_binario);

% sinal sem a redundancia
s_nao_codificado = sinal_binario;


% função que gera as matriz geradora e de verificação de paridade
function [G, H] = matriz_geradora_e_paridade()
    M = 1:7;
    M = dec2bin(M);
    H = eye(3);
    
    for i = 3:7
        if i == 4
            continue
        end
        linha = M(i,:);
        coluna = str2num(linha(:));
        H = [H coluna];
    end
    
    P = H(:,4:7);
    G = [P' eye(4)];
end

% função que aplica o codigo de Hamming(7,4) ao sinal binario
function [palavras_codigo, H] = codificacao_de_hamming(fonte_de_simbolos)

    qtd_simbolos = length(fonte_de_simbolos);
    
    qtd_palavras_codigo = qtd_simbolos/4;
    
    palavras_codigo = zeros(1,7*qtd_palavras_codigo);
    [G, H] = matriz_geradora_e_paridade;

    for i = 1:qtd_palavras_codigo
       j = (i-1)*4;
       k = (i-1)*7;
       mensagem = fonte_de_simbolos(1+j:4+j);
       palavra_codigo = mod(mensagem*G, 2);
       palavras_codigo(1+k:7+k) = palavra_codigo;
    end
    
    palavras_codigo = logical(palavras_codigo);
end

