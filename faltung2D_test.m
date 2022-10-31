% es liest ein Bild ein, glaettet und das Ergebnis anzeigt
I=imread('lena.png');

% Filtert das Bild I mit einem (zweidimensionalen) Gauss-Filter mit Standardabweichung sigma.
sigma = input(" gewunschte Sigmal: ");
% Laufzeit aufmessen
tic
I_gauss=gaussFilter(I,sigma, 'choose');
toc
% von "double" wieder zu "uint8" casten
I_gauss=uint8(I_gauss);                             
figure(1);
subplot(1,2,1),imshow(I),title('originales Bild');
subplot(1,2,2),imshow(I_gauss),title('glaettet Bild mit 2d Filter');

% Filtert das Bild I mit zwei (eindimensionalen) Gauss-Filter mit Standardabweichung sigma.
tic
I_gauss_sep=gaussFilterSep(I,sigma);
toc
I_gauss_sep=uint8(I_gauss_sep);
figure(2);
subplot(1,2,1),imshow(I),title('originales Bild');
subplot(1,2,2),imshow(I_gauss_sep),title('glaettet Bild mit 1d Filter');

  %=============== Antworten von der Fragen ===============%
  %{
       Aufgabe2.a
       Welche Unterschiede bestehen zwischen den Funktionen (conv2 oder imfilter)?
       Antwort: Durch conv2 wird der Filterkern um 180 Grad umgekehrt.
                    Durch imfilter wird der Filterkern nicht um 180 Grad umgekehrt.
  %}
   %================ Antworten von der Frage ===============%
