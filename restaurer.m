function [ restoredImg ] = restaurer( image, imgRef )

%map niveau de gris
mapndg = ([0:255]/255)'*[1 1 1];



% La modelisation du filtre de degradation (spatial)
h = zeros(size(image));
sizeImgX = size(image,1);
sizeImgY = size(image,2);
sizeX = 5;
sizeY = 7;
for i=1+floor(sizeImgX/2) - floor(sizeX/2):1+floor(sizeImgX/2) + floor(sizeX/2)
    for j=1+floor(sizeImgY/2) - floor(sizeY/2):1+floor(sizeImgY/2) + floor(sizeY/2)
        h(i,j) = 1/(sizeX*sizeY);
    end
end

% La modelisation du filtre de degradation (frequentiel)
H = fftshift(fft2(h));

% Le spectre de puissance de l'image ideale
modI = abs(fftshift(fft2(imgRef)));
Pi = modI.*modI;



% Le spectre de puissance du bruit
Dref = fftshift(fft2(imgRef)).*H;
dref=fftshift(ifft2(Dref));



drefInt = floor(dref);
b = dref - drefInt;

modB = abs(fftshift(fft2(b)));
Pb = modB.*modB;



% Filtre de restauration de Wiener
absH2 = abs(H).*abs(H);
W = (1./H).*(absH2./(absH2+Pb./Pi));



% L'image degradee
D = fftshift(fft2(image));

% Restauration : spectre
RestoredImg = D.*W;

% Transformee inverse
restoredImg = fftshift(ifft2(RestoredImg));

AfficherImg(logNormalise(restoredImg), mapndg);
return;

end


function [affIM] = logNormalise(img)
    affIM = abs(img)+1;
    maxi = max(max(affIM));
    mini = min(min(affIM));
    affIM = (log(affIM)-log(mini))/(log(maxi)-log(mini))*255;
end

