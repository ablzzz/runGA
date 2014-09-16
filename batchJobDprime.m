[Xopt] = ga(@(x)objectiveFunctionGaborDprime(x, audSpeechEmer, audEmer,  bw1, wt, theta, 3, spaceBBC8CleanCarWindown, dim, modelClean,  modelEmergency), 60,[],[],[],[],lb,ub,[],intCon,options);


