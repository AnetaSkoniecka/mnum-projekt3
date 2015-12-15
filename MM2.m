function [ X, Y ] = MM2( x0,n )
    Y=zeros(n,1);
    X=zeros(n,1);
    xk = x0;
    for i=1:n
        zp = -2*wielomian(xk)/(wielomianPochodna(xk)+sqrt(wielomianPochodna(xk)^2-2*wielomian(xk)*wielomianPochodnaDruga(xk)));
        zm = -2*wielomian(xk)/(wielomianPochodna(xk)-sqrt(wielomianPochodna(xk)^2-2*wielomian(xk)*wielomianPochodnaDruga(xk)));
        if abs(wielomianPochodna(xk)+sqrt(wielomianPochodna(xk)^2-2*wielomian(xk)*wielomianPochodnaDruga(xk))) > abs(wielomianPochodna(xk)-sqrt(wielomianPochodna(xk)^2 - 2*wielomian(xk)*wielomianPochodnaDruga(xk)))
            zmin = zp;
        else
            zmin = zm;
        end
        xk = xk+zmin;
        X(i) = xk;
        Y(i) = wielomian(X(i));
    end
end