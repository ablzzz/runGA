function G = objectiveFunctionGabor(x, y, bw, wt, theta, crTemplate, flag )
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
crtemp1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
%G = pdist2(crTemplate(:)', crtemp1(:)', 'cosine')
G = crtemp1 - crTemplate;
G = G.*G;
G = sum(G(:))
   
