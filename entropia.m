function h = entropia(p)
    
    i1 = find(p==0 | p==1);
    i2 = find(p~=0 & p~=1);
    
    h(i1) = zeros(size(i1));
    h(i2) = -(p(i2) .* log2(p(i2)) + (1-p(i2)) .* log2(1-p(i2)));
end

