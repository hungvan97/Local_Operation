% Script zur Einführung in die eindimensionale Faltung

%% Testfunktion

% generiere Stützstellen, an denen die Funktion ausgewertet werden soll
dx = 0.5;
xs = -5:dx:5;

x = 1/4 * sqrt(abs(xs));
% x = xs.^3 + xs + 1;

%% Faltung

% Filterkern f
f = 1/dx * [1/2, 0, -1/2];

% TODO b)

y = conv(x, f, 'same');

%% Darstellung

figure(1);
clf;

subplot(1, 2, 1);
plot(xs, x, '-b.');
title('Funktion');
subplot(1, 2, 2);
plot(xs, y, '-b.');
title(['Ergebnis mit Filter ', mat2str(f)]);  title(['Ergebnis mit Filter ', mat2str(f)]);

%% Randbehandlung
% TODO c)
clear all;clc
  Input_x = input(' Bitte geben Sie einen Vektor (Input_x) ein. Achtung: Bitte mit [ anfangen und mit ] enden: ');
  Input_Filter = input(' Bitte geben Sie einen Filterkern (Input_Filter) ein: ');
  % Achtung: Filtermask will have odd number of element, so anchor/center point of the kernel 
  % will be calculated based on its neighbor to extract feature, or else we have
  % to account for distortion across the layers, which happens using an even sized kernel
  n1 = size(Input_Filter,2);                                      % Anzahl der Element von Filter bekommen (dim = 2, number of col)
  n2 = size(Input_x,2);                                           % Anzahl der Element von Input_x bekommen
  n3 = (n1-1)/2;                                                  % Anzahl der added 0 Element 
  
% Randbehandlung: Zero padding
  z1 = zeros(1,n3);                                                
  Input_x1 = [z1 Input_x z1];   
  Output_x1 = conv(Input_x1,Input_Filter,'valid');
  
 % Randbehandlung: Spiegelung
  z2 = fliplr(Input_x(:,1:n3));                                   % Vor der Element von Input_x bekommen                                    
  z3 = fliplr(Input_x(:,n2-n3+1:n2));                             % Nach der Element von Input_x bekommen
  Input_x2 = [z2 Input_x z3];                                     % Elemente hinzufuehren(
  Output_x2 = conv(Input_x2,Input_Filter,'valid');
  
 % Darstellung 
  figure;
  subplot(2,2,1);
  plot( Input_x, '-b.');title("Darstellung von Input_x");
  subplot(2,2,3);
  plot( Output_x1, '-b.');title("Randbehandlung: Zero padding");
  subplot(2,2,4);
  plot( Output_x2, '-b.');title("Randbehandlung: Spiegelung");

  %=============== Antworten von der Fragen ===============%
  %{
       Aufgabe1.a
       Welche Auswirkung hat der Parameter ¡¯same¡¯? 
       Welche Varianten sind ebenfalls implementiert?
       Antwort: Die Laenge des Ausgangsignals ist gleich die Laenge des Eingangsignals.
                    full(default) ,valid und same.
        
       Aufgabe1.b   
       Welche Unterschiede bestehen zwischen den Filtern?
       Wofuer koennten die verschiedenen Filter genutzt werden?
       Antwort: Die Gewichte der Elemente von Filterkerne sind unterschiedlich.
                    In Bezug auf den Ausgangssignal sind die Ausgangswerte ein
                    bischen verschieben.
                    Verschiedene Bilder brauchen verschiedene Kantenfilter, 
                    um bestimmt benoetigte Ausgangsbilder zu bekommen.
                    Und zwar, die Effekte der Ausgangsbilder sind abhaengig von Filterkernen.
  
       Aufgabe1.c
       Welche Randbehandlung verwendet die Funktion conv?
       Antwort: Zero padding, und zwar mit 0 hinzufuegen
  
       Was sind Vor- und Nachteile der verschiedenen Varianten?
       Antwort: Im Bezug auf Zero-padding
                    Vorteile: einfach zu berechnen, wenn die Anzahl der
                    Element von Filter sehr gross ist.
                    Nachteil: Im Rand gibt es vielleicht die dunkele Linie.
                    Im bezug auf Spiegelung
                    Vorteile: Im Rand gibt es keine dunkele Linie.
                    Nachteile:Hoeherer Rechenaufwand, wenn die Anzahl der
                    Element von Filter sehr gro? ist.
  %}
  %================ Antworten von der Frage ===============%