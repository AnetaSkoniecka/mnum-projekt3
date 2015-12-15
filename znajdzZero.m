function [ x,y,iter ] = znajdzZero(a,b,n,epsilon,method)
%ZNAJDZZERO szuka miejsce zerowe funkcji
% a - poczatek przedzialu
% b - koniec przedzialu
% n - limit iteracji
% epsilon - wymagana dokladnosc
% method - metoda
% x - wektor wyznaczonej wartosci x w kazdej iteracji
% y - wektor przyblizen miejsca zerowego funkcji
% iter - licznik iteracji
if funMocniak(a)*funMocniak(b) > 0 %czy granice przedzialow sa przeciwnych znakow
 error('funkcja w koncach przedzialu ma wartosci tego samego znaku\n');
end
iter = 0; %licznik iteracji
y=zeros(n,1);
x=zeros(n,1);
for i=1:n
 iter = iter+1;
 if strcmp(method,'bisekcja')
    c = (a+b)/2; %srodek przedzialu
    %c zastepuje te granice przedzialu, ktora jest tego samego znaku
    if funMocniak(c)*funMocniak(a) < 0
        b=c;
    elseif funMocniak(b)*funMocniak(c) < 0
        a=c;
    end
    %wynikiem iteracji jest ta granica przedzialu, dla ktorej
    %funkcja przyjmuje mniejsza wartosc
    if abs(funMocniak(a)) < abs(funMocniak(b))
        x(i)=a;
    else
        x(i)=b;
    end
 elseif strcmp(method,'sieczne')
    %a - punkt z przedpoprzedniego kroku
    %b - punkt z poprzedniego kroku
    %c - punkt z obecnego kroku - miejsce przeciecia siecznej z osia x
    c = b-((funMocniak(b)*(b-a))/(funMocniak(b)-funMocniak(a)));
    %zastapienie wartosci z poprzednich krokow
    a=b;
    b=c;
    %wynikiem iteracji jest ten krok, dla ktorej
    %funkcja przyjmuje mniejsza wartosc
    if abs(funMocniak(a)) < abs(funMocniak(b))
        x(i)=a;
    else
        x(i)=b;
    end
 elseif strcmp(method,'newton')
    %c - przeciecie stycznej do funkcji w punkcie a z osia x
    c=a-funMocniak(a)/funMocniakPochodna(a);
    %c staje si? wybranym punktem w nastepnym kroku
    a=c;
    x(i)=a;
 else
    e
    error('brak wybranej metody');
 end
 y(i)=abs(funMocniak(x(i)));
 %warunek stopu
 if abs(y(i))<=epsilon
 break;
 end
end
end
