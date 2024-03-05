function p = qf(xlist)
    p = zeros(size(xlist));
    i = 0;
    for x = xlist
        i = i+1;
        if(x < 0)
            p(i) = 1- 0.5*erfc(-x/sqrt(2));
        else
            p(i) = 0.5*erfc(x/sqrt(2));
        end
    end
end