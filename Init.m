function [Te, t, f, tPratique] = Init ( )

a = -5;             % Temps initial   (s)
b = 5;              % Temps final     (s)
To = b - a;         % Plage de mesure (s)

N = 32768;          % Nombre d'échantillons

Te = To/N;          % Période d'échantillonnage (Hz)
t = a:Te:b-Te;      % Echantillonnage du temps [a , b] avec un pas de Te (s)

fe = 1/Te;          % Fréquence d'échantillonnage (Hz)

df = fe/N;          % Ecart fréquentiel entre deux échantillons successifs
f = -fe/2:df:fe/2-df;  % Echantillonnage des fréquences pour traçage, avec un pas de df (Hz)

% Pour une représentation temporelle plus rapide :
tPratique = a:Te*50:b-Te;

end
