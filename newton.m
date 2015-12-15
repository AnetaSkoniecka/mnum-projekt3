function [ X ] = newton( a,n )
    X=zeros(n,1);
    for i=1:n
        c=a-wielomian(a)/wielomianPochodna(a);
        a=c;
        X(i) = a;
    end
end

