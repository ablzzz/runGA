function R = getPost(folder, ext, model1, model2, space, dim, gab_filters)
loadload; close;
%cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
files = dir(fullfile(folder, ext))
name = {files.name};
fileList = sort_nat(name);
paras = [10 4 0 0];
rv=2.^[1:1:5];
sv=2.^[-2:1:3];
for j = 1 : length(files);
	[x fs] = wavread([folder '/' fileList{j}]);
	 x = x(:,1);
    	x=resample(x,16000,fs);
    	x=unitseq(x);
    	x=wind(x,16000);
    	for i= 1: size(x,1)
        	y=wav2aud(x(i,:),paras);
        	y=y.^(1/3);
    		cr=aud2cor_gab(y, rv,sv,gab_filters); %%%%%%%2D gabor filtering
    		crtemp1 = squeeze(mean(abs(cr),3));
    		[R(1,i) R(2,i)] = getPost(crtemp1,space, dim, model1, model2); 
		
	end
end
