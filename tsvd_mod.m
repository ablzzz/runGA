function [tsvd_map]=tsvd_mod(A)

% Tensor singular value decomposition 
% [tsvd_map] = tsvd_mod(A)
% A: n-mode Tensor
% U: singular vectors of subspaces of tensor A
% La: singular values of subspaces of tensor A
  
% Make sure data is zero mean
  tensor_mean = mean(A, length(size(A)));
 A = bsxfun(@minus, A, tensor_mean); %%%change
  
  for cnt = 1:length(size(A))-1
    An = unfoldn(A,cnt); % unfold the tensor along each subspace
   [U{cnt} La{cnt} V{cnt}] = svd(cov(An'));
%     [U{cnt} La{cnt} V{cnt}] = svd(An*An'); %change
  end

  
  tsvd_map.U = U;
  tsvd_map.La = La;
  tsvd_map.mean = tensor_mean;
 
  