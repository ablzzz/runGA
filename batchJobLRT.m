[Xopt] = ga(@(x)objectiveFunctionGaborLRT(x, ynoisyspeech, ynoise,  bw1, wt, theta, 3, spaceGATimitBBCCafe, dim, modelCleanTimit, modelNoise ), 60,[],[],[],[],lb,ub,[],intCon,options);


