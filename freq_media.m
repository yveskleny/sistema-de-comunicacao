function f_media = freq_media(fs, x)
    
    X = fft(x);
    L = round(length(X)/2);
    
    k = (1:L) - 1;
    
    num = sum( k.*abs(X(1:round(end/2))).^2 );
    den = sum( abs(X(1:round(end/2))).^2 );
    
    k_media = num/den;
    
    f_media = (fs/2)*(k_media/L);
end