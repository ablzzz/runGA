function R = extractAud(fileName, lab)
loadload; close;
%cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
paras = [10 4 0 0];
[x fs] = wavread(fileName);
x = x(:,1);
x=resample(x,16000,fs);
x=unitseq(x);
x=wind(x,16000);
indStart = (1/0.25)*lab(:,1);
indEnd = (1/0.25)*lab(:,2);
ind = [];
for j = 1 : length(lab(:,1));
	ind = [ind  [indStart(j) : indEnd(j)]]
end
k=1;
for i= ind
	y=wav2aud(x(i,:),paras);
        y=y.^(1/3);
	R(k).y = y;
    	k = k + 1;
end
