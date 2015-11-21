function [ ] = Modulation ( )

% Initialisation des parametres
[Te, t, f, tp] = Init();
fe = 1/Te;
f1 = 500;
f2 = 1000;
T0 = 1/20;    % La plus grande periodes dans les sommes (n=1 => w=40pi => T0) = periode de chacun des signaux
T = 2*T0;     % Periode permettant d'afficher 4 périodes de chaque signal (entre -T et + T)

% Creation des deux signaux
s1 = zeros(size(t, 1));
s2 = zeros(size(t, 1));
for n=1:5

  s1 = s1 + n*cos(2*pi*20*n*t);
  s2 = s2 + (6-n)*cos(2*pi*20*n*t);
  
end

% Affichage des signaux s1 et s2
figure(1):subplot(2,1,1);
plot(t, s1);
title('s1(t)');
axis([-T, T]);
figure(1):subplot(2,1,2);
plot(t, s2);
title('s2(t)');
axis([-T, T]);

% Construction du signal somme module
c = s1.*cos(2*pi*f1*t) + s2.*cos(2*pi*f2*t);

% Affichage du signal somme
figure(2):plot(t, c);
title('c(t)');
axis([-T, T]);

% Construction des signaux d1 et d2
d1 = c.*cos(2*pi*f1*t);
d2 = c.*cos(2*pi*f2*t);

% Affichage des signaux d1 et d2
figure(3):subplot(2,1,1);
plot(t, d1);
title('d1(t)');
axis([-T, T]);
figure(3):subplot(2,1,2);
plot(t, d2);
title('d2(t)');
axis([-T, T]);

% Passage en frequences
D1 = tfour(d1);
D2 = tfour(d2);

% Affichage des signaux D1 et D2
figure(5):subplot(2,1,1);
plot(f, D1);
title('D1(f)');
figure(5):subplot(2,1,2);
plot(f, D2);
title('D2(f)');

size(D1, 2)

% Filtrage : on ne garde que les frequences entre ...
for ii=1:size(D1,2)

  if (abs(f(1,ii)) > 500)
    D1(1, ii) = 0
    D2(1, ii) = 0
  end

end

% Transformee de Fourier inverse pour repasser en temporel
fd1 = tfourinv(D1);
fd2 = tfourinv(D2);

% Affichage des signaux filtrees
figure(4):subplot(2,1,1);
plot(t, fd1);
title('fd1(t)');
axis([-T, T]);
figure(4):subplot(2,1,2);
plot(t, fd2);
title('fd2(t)');
axis([-T, T]);



end
