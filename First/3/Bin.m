function Y = Bin(p,n,m)
X = Ber(p,n,m);
Y = sum(X,1);
end