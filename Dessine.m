function [] = Dessine (t, tp, f)

% Définition de la fonction à tracer
x = x5(t, 1);
xp = x5(tp, 1);

% Calcul de la transformée de Fourier
X = tfour(x);

% Calcul de la transformée inverse
s = tfourinv(X);

% Affichages
figure(1):plot(tp, xp);
title('x(t) theorique');
figure(2):subplot(2,1,1);
plot(f, real(X));
title('Transformee de Fourier de x(t) - Partie Reelle');
figure(2):subplot(2,1,2);
figure(3):plot(f, imag(X));
title('Transformee de Fourier de x(t) - Partie Imaginaire');
figure:plot(t, s);
title('Reconstitution de x(t)');

end
