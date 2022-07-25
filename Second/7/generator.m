function [x,y] = generator(n)
    alpha = random('uniform',0,2*pi,[1, n]);
    r = sqrt(random('uniform',0,1,[1, n]));
    
    x = r.*cos(alpha);
    y = r.*sin(alpha);
end