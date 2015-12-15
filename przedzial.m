function [ a, b ] = przedzial( x10, x20, n )

    beta = 1.2;

    x1 = x10;
    x2 = x20;

    for j=1:n
        if funI(x1) * funI(x2) < 0
            a = x1;
            b = x2;
        elseif abs(funI(x1)) < abs(funI(x2))
            x1 = x1 * beta * (x2 - x1);
        else
            x2 = x2 + beta * (x2 - x1);
        end
    end

end

