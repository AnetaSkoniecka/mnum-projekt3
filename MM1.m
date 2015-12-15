function [ X, Y ] = MM1( x1,n )
    Y=zeros(n,1);
    X=zeros(n,1);
    x0=x1-0.5;
    x2=x1+0.5;
    for i=1:n
        fx0 = wielomian(x0);
        fx1 = wielomian(x1);
        fx2 = wielomian(x2);
        z0 = x0 - x2;
        z1 = x1 - x2;
        a = (fx1-fx2)/(z1^2-z0*z1) - (fx0-fx1)/(z1-z0^2);
        b = (fx0-fx2-a*z0^2) / z0;
        c = fx2;
        zp = -2*c / ( b + sqrt(b^2 - 4*a*c) );
        zm = -2*c / ( b - sqrt(b^2 - 4*a*c) );
        if( abs(b + sqrt(b^2 - 4*a*c)) >= abs(b - sqrt(b^2 - 4*a*c)) )
            zmin = zp;
        else
            zmin = zm;
        end
        x2 = x2 + zmin;
        X(i) = x2;
        Y(i) = wielomian(X(i));
    end
end