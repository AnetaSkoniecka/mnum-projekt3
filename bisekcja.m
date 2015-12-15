function [ X, Y ] = bisekcja( a,b,n )
    if funI(a) * funI(b) > 0
        error('niepoprawny przedzial \n');
    end
    Y=zeros(n,1);
    X=zeros(n,1);
    for i=1:n
        c = (a+b) / 2;
        if funI(c) * funI(a) < 0
            b = c;
        elseif funI(c) * funI(b) < 0
            a = c;
        else
            error('niepoprawny przedzial \n');
        end
        Y(i) = funI(c);
        X(i) = c;
    end
end

