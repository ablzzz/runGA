function G = objectiveFunctionGabor(x, y, yn,  bw, wt, theta, flag, tsvd_map, dim, modelClean, modelNoise )
paras(1)=10;
paras(2)=4;
paras(4)=0;
rv=2.^[1:1:5];
sv=2.^[-2:1:3];
switch flag 
    case 4,
        bwInd1 = bw(x(1:60)); 
        bwInd2 = bw(x(61:120));
        wtInd = wt(x(121:180));
        thetaInd = theta(x(181:240)); 
    case 3
        thetaInd = theta(x(1:60)); 
        wtInd = ones(1,60);
        bwInd1 = 2*ones(1,60);
        bwInd2 = 2*ones(1,60);
    case 2
        thetaInd = zeros(1,60); 
        wtInd = wt(x(1:60));
        bwInd1 = 2*ones(1,60);
        bwInd2 = 2*ones(1,60);
    case 1
        thetaInd = zeros(1,60); 
        wtInd = ones(1,60);
        bwInd1 = bw(x(1:60));
        bwInd2 = bw(x(61:120));
end
gab_filters=create_filters(paras,rv,sv, bwInd1, bwInd2, wtInd, thetaInd );
cr=aud2cor_gab(y,paras,rv,sv,gab_filters); %%%%%%%2D gabor filtering
cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
lrt1n = getPost(cr1, tsvd_map, dim, modelClean); lrt1n = exp(-lrt1n);
lrt1d = getPost(cr1, tsvd_map, dim, modelNoise); lrt1d = exp(-lrt1d);
cr=aud2cor_gab(yn,paras,rv,sv,gab_filters); %%%%%%%2D gabor filtering
cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
lrt2n = getPost(cr1, tsvd_map, dim, modelClean); lrt2n = exp(-lrt2n);
lrt2d = getPost(cr1, tsvd_map, dim, modelNoise); lrt2d = exp(-lrt2d);
G = (lrt1d + lrt2n)/(lrt1n + lrt2d);
