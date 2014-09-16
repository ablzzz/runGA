function G = objectiveFunctionGabor(x, y, bw, wt, theta, flag, tsvd_map, dim, model )
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
cr1= cr1 -tsvd_map.mean;
cr1 = tmuln(cr1,tsvd_map.U{1}(:,:)',1);
cr1 = tmuln(cr1,tsvd_map.U{2}(:,:)',2);
cr1 = tmuln(cr1,tsvd_map.U{3}(:,:)',3);
cr1=cr1(1:dim(1),1:dim(2), 1:dim(3));
feat = cr1(:);
data1 = unitseq(feat);
[d G] = model.posterior(data1')
