    function G = getPost(y, yn, tsvd_map, dim, modelClean, modelNoise, gab_filters)
%cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
paras = [10 4 0 0];
rv=2.^[1:5];
sv=2.^[-2:3];
cr=aud2cor_gab(y,paras,rv,sv,gab_filters); %%%%%%%2D gabor filtering
cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
lrt1n = getPost(cr1, tsvd_map, dim, modelClean); lrt1n = exp(-lrt1n);
lrt1d = getPost(cr1, tsvd_map, dim, modelNoise); lrt1d = exp(-lrt1d);
cr=aud2cor_gab(yn,paras,rv,sv,gab_filters); %%%%%%%2D gabor filtering
cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
lrt2n = getPost(cr1, tsvd_map, dim, modelClean); lrt2n = exp(-lrt2n);
lrt2d = getPost(cr1, tsvd_map, dim, modelNoise); lrt2d = exp(-lrt2d);
G = (lrt1d + lrt2n)/(lrt1n + lrt2d);
G = log(G)