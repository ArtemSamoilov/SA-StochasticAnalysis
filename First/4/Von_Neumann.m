function b = Von_Neumann(n)
  b = [];
  x = [];
  
  k = sqrt(2 * pi/exp(1));
  f1 = @(x)1/pi .* (1./(x.^2 + 1));
  f2 = @(x) 1/(sqrt(2 * pi)) .* exp(-x.^2/2);  
  
  while size(b,2) <= n
     x = Cauchy(0, 1, 1, n-size(x,2));
     u = Ber(f2(x)./(k .* f1(x)), 1, 1);
     x = x.*u;
     x = x(x~=0);
     b = [b x];
  end
end