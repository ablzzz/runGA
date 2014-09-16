function R = getPost(folder, ext, model)
%cr1 = squeeze(mean(abs(cr),3));%%%%%%%%MISSING ABS%
files = dir(fullfile(folder, ext))
for j = 1 : length(files);
	x = load([folder '/' files(j).name]);
	x=unitseq(x);
    	[d R(j)] = model.posterior(x');
end
