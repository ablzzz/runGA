function G = objectiveFunctionGabor(x, audNoisySpeech, audNoise,  bw, wt, theta, flag, tsvd_map, dim, modelClean, modelNoise )
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
classNoisySpeechLab = projectGetPosterior(audNoisySpeech, rv,sv, gab_filters, modelClean, modelNoise, tsvd_map, dim);
classNoiseLab = projectGetPosterior(audNoise, rv, sv, gab_filters, modelClean, modelNoise, tsvd_map, dim);
hitRate = (sum(classNoisySpeechLab == 1))/(length(classNoisySpeechLab)); 
falseAlarm = (sum(classNoiseLab == 1))/(length(classNoiseLab));
%G = norminv(hitRate) - norminv(falseAlarm);
G = (falseAlarm - hitRate)



