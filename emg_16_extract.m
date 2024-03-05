function sinal = emg_16_extract(filename)

fid = fopen(filename,'r');
if fid == -1
    sinal = -1;
else
    sinal = fread(fid, [16,inf], 'short');
    fclose(fid);
end

