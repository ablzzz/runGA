function An=unfoldn (A,n)

% An=unfoldn (A,n)
% unfoldn: Tensor unfolding along 'n'th dimension.
% A: input tensor
% n: unfolding dimension

if length(size(A))<n error('Invalid dimension');end
temp=shiftdim(A,n-1);
An=temp(:,:);