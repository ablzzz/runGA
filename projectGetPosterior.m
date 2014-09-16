function R = getPost(audFiles, rv, sv, gab_filters, modelC, modelN, tsvd_map, dim)
paras = [10 4 0 0];
for j = 1 : length(audFiles)
	y = audFiles(j).y;
	cr  = aud2cor_gab(y,rv,sv,gab_filters);
	cr1 = squeeze(mean(abs(cr),3));	
 	cr1= cr1 -tsvd_map.mean;
	cr1 = tmuln(cr1,tsvd_map.U{1}(:,:)',1);
	cr1 = tmuln(cr1,tsvd_map.U{2}(:,:)',2);
	cr1 = tmuln(cr1,tsvd_map.U{3}(:,:)',3);
	cr1=cr1(1:dim(1),1:dim(2), 1:dim(3));
	feat = cr1(:);
	data1 = unitseq(feat);
	[d R1(j)] = modelC.posterior(data1');
	[d R2(j)] = modelN.posterior(data1');
end

%R = [R1;R2];
[a R] = max([-R1 ; -R2]);
