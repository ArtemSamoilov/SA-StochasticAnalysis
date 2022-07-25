%% Task 6

%% Monte-Carlo
clc
alpha = 0.05;
n = 10^7;

tic
x = 1/sqrt(2) * randn(10, n);
g = @(x)pi^5 * exp(-1./(2.^7*prod(x.^2)))./prod(x.^2);
s = cumsum(g(x))./(1 : n);
integral_val =  mean(g(x))
toc

s1 = cumsum(g(x).^2);
s2 = cumsum(g(x));
d = s1(2:end)./(1 : n - 1) - (2 : n).*(s(2 : end)).^2./(1 : n - 1);

epsilon = norminv(1 - alpha/2) * sqrt(d)./sqrt(1:n - 1);

disp(epsilon(end))

%% Quad
clear
clc
F = @(x) pi^10 .*exp(-(sum(tan(pi/2.*x).^2)+ 1./128.*(prod(cot(pi/2.*x).^2))))./prod(sin(pi/2.*x).^2); 
n = 3;

tic
gridd = (1/(2*n)) : (1/n) : (1/(2*n)) + (n-1)/n;
cartesianProduct = allcomb(gridd, gridd, gridd, gridd, gridd, gridd, gridd, gridd, gridd, gridd);
I = 0;
for i = 1:size(cartesianProduct, 1)
    I = I + F(cartesianProduct(i, :));
end
I = I / n^10
time = toc

%% Function for Quad
function cartes = allcomb(varargin)    
    narginchk(1,Inf);
    NC = nargin;
    if ischar(varargin{end}) && (strcmpi(varargin{end}, 'matlab') || strcmpi(varargin{end}, 'john'))
        NC = NC-1;
        ii = 1:NC;
    else
        ii = NC:-1:1;
    end
    
    args = varargin(1:NC);
    if any(cellfun('isempty', args))
        cartes = zeros(0, NC);
    elseif NC == 0
        cartes = zeros(0,0); 
    elseif NC == 1
        cartes = args{1}(:); 
    else
        isCellInput = cellfun(@iscell, args);
        if any(isCellInput)
            if ~all(isCellInput)
                error('Invalid Cell Input');
            end
            ix = cellfun(@(c) 1:numel(c), args, 'un', 0);
            [ix{ii}] = ndgrid(ix{ii});

            cartes = cell(numel(ix{1}), NC);
            for k = 1:NC
                cartes(:,k) = reshape(args{k}(ix{k}), [], 1);
            end
        else
            [cartes{ii}] = ndgrid(args{ii});
            cartes = reshape(cat(NC+1,cartes{:}), [], NC);
        end
    end
end

