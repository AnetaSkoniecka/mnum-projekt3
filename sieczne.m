function [ X, Y ] = sieczne( a,b,n )
    if funI(a)*funI(b) > 0
        error('niepoprawny przedzial \n');
    end
    Y=zeros(n,1);
    X=zeros(n,1);
    for i=1:n
        c = b - ( ( funI(b)*(b-a) ) / ( funI(b)-funI(a) ) );
        a=b;
        b=c;
        if abs( funI(a) ) < abs( funI(b) )
            X(i)=a;
        else
            X(i)=b;
        end
        Y(i) = funI(X(i));
    end
end

