function [pesan_ektraksi]=lsbekstrak(hasil_gmb_stego,pjg_bit_pesan);

%ektraksi
%stego=imread('stego.bmp');
%[baris,kolom]=size(hasil_gmb_stego);
hasil_gmb_stego=hasil_gmb_stego(:);
bitpesan=[];
for i=1:pjg_bit_pesan
    if mod(hasil_gmb_stego(i),2)==0
        bitpesan=[bitpesan '0'];
    end
    if mod(hasil_gmb_stego(i),2)==1
        bitpesan=[bitpesan '1'];
    end
end

pesan_ektraksi=[];
for i=1:8:pjg_bit_pesan
    desimal=bin2dec(bitpesan(i:i+7));%biner dijadikan desimal
    pesan_ektraksi=[pesan_ektraksi char(desimal)]; %desimal diubah ke huruf
end
%disp(['Hasil ekstraksi Pesan = ',pesan_stego]);