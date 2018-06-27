function [pjg_bit_pesan,hasil_gmb_stego]=lsbsisip(enc,citra);

Pesan = uint8(enc); %ASCII 
panjang_pesan=length(Pesan); %menghitung panjang pesan

[baris,kolom]=size(citra);
olah=citra(:); %matrik dijadikan satu baris

%pesan dijadikan biner
bit_pesan=[];
for i=1:panjang_pesan
    biner=dec2bin(Pesan(i),8);
    bit_pesan=[bit_pesan biner];
end
pjg_bit_pesan=length(bit_pesan);
setappdata(0,'pjgInFunction',pjg_bit_pesan);

%penyisipan
for i=1:pjg_bit_pesan
    if(mod(olah(i),2)==0)&(bit_pesan(i)=='1')
        olah(i)=olah(i)+1;
    end
    if(mod(olah(i),2)==1)&(bit_pesan(i)=='0')
        olah(i)=olah(i)-1;
    end
end
hasil_gmb_stego=reshape(olah,[baris kolom]); %citra baris dijadikan matrik
setappdata(0,'hslFunction',hasil_gmb_stego);
imwrite(hasil_gmb_stego,'stego.bmp');