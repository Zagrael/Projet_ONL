function y = deblurr_cvx(A,x,lambda)

n = length(x);

cvx_begin
    variables y(n)
    minimize( norm(A*y - x, 2) + lambda * norm(y, 2))
    subject to
    y >= 0
    y <= 1
cvx_end

end