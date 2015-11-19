function [ restoredImg ] = restaurer( image, imgRef )

% L'image dégradée
D = fft2(image);

% La modèlisation du filtre de dégradation (spatial)
h = zeros(size(image));
sizeImgX = size(image,1);
sizeImgY = size(image,2);
sizeX = 5;
sizeY = 3;
for i=floor(sizeImgX/2) - floor(sizeX/2):floor(sizeImgX/2) + floor(sizeX/2)
    for j=floor(sizeImgY/2) - floor(sizeY/2):floor(sizeImgY/2) + floor(sizeY/2)
        h(i,j) = 1/(sizeX*sizeY);
    end
end

% La modèlisation du filtre de dégradation (fréquentiel)
H = fft2(h);

% Le spectre de puissance de l'image idéale
modI = abs(fft2(imgRef));
Pi = modI.*modI;

% Le spectre de puissance du bruit
Dref = fft2(imgRef).*H;
dref=ifft2(Dref);
drefInt = round(dref);
b = dref - drefInt;
modB = abs(fft2(b));
Pb = modB.*modB;

% Filtre de restauration de Wiener
absH2 = abs(H).*abs(H);
W = (1./H).*(absH2./(absH2+Pb./Pi));

% Restauration
restoredImg = D.*W;

end

