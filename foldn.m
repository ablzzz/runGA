function C=foldn (An,N,dim)
% C=foldn (An,N)
% foldn: fold a matrix into its tensor representation. 
% An: matrix unfolding of tensor along Nth dimenstion
% N: the size of the tensor
% dim: the dimension of An, this parameter is needed to disambiguate the
% case when N has more than one dimesion that match the number of rows of An

if (length(find(size(An,1)==N))==0) | (prod(N)~=prod(size(An)))
    error('Specified tensor size is invalid');
end
if nargin<3 
    if (length(find(size(An,1)==N))>1)
        error('Ambiguous dimension specified');
    else
        dim=find(size(An,1)==N);
    end
end
if N(dim)~=size(An,1)
    error('Wrong dimension specified');
end
index=[N(dim:end) N(1:dim-1)]; 
C=reshape(An,index);
C=shiftdim(C,1+length(N)-dim);