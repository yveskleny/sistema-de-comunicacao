dt = 0.1;
t = 0:dt:1;
f = 1;

onda_carregadora = sin(2*pi*f*t);
L = length(onda_carregadora);
%onda_carregadora_final = onda_carregadora;
%onda_carregadora = onda_carregadora(1:L-1);

b1_mapeado = 2*s_codificado - 1; 
b2_mapeado = 2*s_nao_codificado - 1; 

s1_modulado = []; % codificado
s2_modulado = []; % não codificado

for i = 1:(length(b1_mapeado))
   s1_modulado = [s1_modulado onda_carregadora*b1_mapeado(i)];
end
   %s1_modulado = [s1_modulado onda_carregadora_final*b1_mapeado(i)];

for i = 1:(length(b2_mapeado))
   s2_modulado = [s2_modulado onda_carregadora*b2_mapeado(i)];
end
   %s2_modulado = [s2_modulado onda_carregadora_final*b2_mapeado(i)];
   
clear dt f i L t
