function [  ] = wykres(  )
    hold on;
    fplot('wielomian(x)',[-3 2]);
    fplot('0',[-3 2]);
    hold off;
end

