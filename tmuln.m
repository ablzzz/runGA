function C=tmuln (A, U, n);
% C=tmuln (A,U,n);
% multiplication operator for a matrix and a tensor
% A: Tensor
% U: Matrix
% n: tensor dimension that the multiplication operator applies

if size(U,2)~=size(A,n)
    error('Inner matrix and tensor dimensions must agree');
end
index=size(A);
C=foldn(U*unfoldn(A,n),[index(1:n-1) size(U,1) index(n+1:end)],n);