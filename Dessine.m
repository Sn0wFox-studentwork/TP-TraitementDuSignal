function [] = Dessine (t, tp, f)

% Définition de la fonction à tracer
x = x3(1, t, 1);
xp = x3(1, tp, 1);

% Calcul de la transformée de Fourier
X = tfour(x);

% Calcul de la transformée inverse
s = tfourinv(X);

% Affichages
figure:plot(tp, xp);
title('x(t) theorique');
figure:plot(f, real(X));
title('Transformee de Fourier de x(t) - Partie Reelle');
figure:plot(f, imag(X));
title('Transformee de Fourier de x(t) - Partie Imaginaire');
figure:plot(t, s);
title('Reconstitution de x(t)');

end
