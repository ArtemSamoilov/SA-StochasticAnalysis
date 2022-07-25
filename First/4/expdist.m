function [x, y] = expdist(lambda, n, m)
    y = rand(n, m);
    if (isempty(find(lambda == 0)) ~= 0)
      x = -log(1 - y)./lambda;
    else
        x = [];
        return;
    end
end