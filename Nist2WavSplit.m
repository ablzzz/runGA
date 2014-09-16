function R = nist2wavsplit(folder, ext, outFolder)
files = dir(fullfile(folder, ext));
rp = randperm(length(files));
k = 1;
for j = rp(1:70)
	[x fs] = readnist([folder '/' files(j).name]);
	y = buffer(x,fs,0);
	[m n] = size(y);
	for k = 1 :n-2
		outFile = [outFolder '/' files(j).name '_' num2str(k)];
		wavwrite(y(:,k), fs, outFile);
	end
end

