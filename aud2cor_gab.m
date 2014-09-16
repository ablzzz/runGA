function cr=aud2cor_gab(y,rv,sv,gab_filters)

% rv=[rv(:)' -1*rv(:)'];
cr=zeros(length(sv),2*length(rv),size(y,1),size(y,2));
for sind=1:length(sv)
    for rind=1:length(rv)
        cr(sind,rind,:,:)=convolve2(y,gab_filters(sind,rind).G, ...
				    'reflect');
        cr(sind,length(rv)+rind,:,:)=convolve2(y,gab_filters(sind, ...
						  length(rv)+rind).G,'reflect');
    end
end
