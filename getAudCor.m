function R = extractFeaturesGabor(folder, ext, ind, gab_filters)
%  maxNumCompThreads(1);
%   path(path,'/home/kpatil/Timbre/NSLtools');
%   path(path,'/home/kpatil/Timbre/AuditoryToolbox');
  loadload;close;
  paras(1)=10;
  paras(2)=4;
  paras(4)=0;
  rv=2.^[1:5];
  sv=2.^[-2:3];
  d=dir(fullfile(folder,ext));
  length(d)
  rp=randperm(length(d));
  j = 1;
  for k= ind
    filename=[folder '/' d(k).name];
    [x,fs]=  wavread(filename);
    x = x(:,1);
    x=resample(x,16000,fs);
    x=unitseq(x);
    x=wind(x,16000);
    size(x)
    y=wav2aud(x(1,:),paras);
    y=y.^(1/3);
    cr  = aud2cor_gab(y,rv,sv,gab_filters);
    R(j).cr1 = squeeze(mean(abs(cr),3));
    j = j +1;
  end
