function [ ans ] = norm_f( x )
    ans = exp(-x.^2./2)./((2*pi)^(1/2));
end

