function extractFeaturesGabor(folder,dest_folder, ext)
%  maxNumCompThreads(1);
%   path(path,'/home/kpatil/Timbre/NSLtools');
%   path(path,'/home/kpatil/Timbre/AuditoryToolbox');
  loadload;close;
  paras(1)=10;
  paras(2)=4;
  paras(4)=0;
  rv=2.^[1:5];
  sv=2.^[-2:3];
  gab_filters=create_filters(paras,rv,sv);
  mkdir(dest_folder);
  d=dir(fullfile(folder,ext));
  length(d)
  rp=randperm(length(d));
  for k= 1 : length(d)
    if(d(k).name(1)~='.')
      filename=[folder '/' d(k).name];
      dest_filename=[dest_folder '/' d(k).name];
      
      if (exist([dest_filename(1:end-3) 'gabmaidst'])==0)
	
	cr1=[];
%	save([dest_filename(1:end-3) 'mat'], 'cr1')
	%filename
	[x,fs]=  wavread(filename);
	x = x(:,1);
	% fid = fopen(filename,'rb',endian);
%    [x,cnt]= fread(fid, inf, 'int16');
 %   fclose(fid);
%    fs = 16000;
	if (length(x)>0.1*fs)
	  
	  x=resample(x,16000,fs);
%	  x=filter(b,a,x);
	  x=unitseq(x);
	  x=wind(x,16000);
 	  size(x)
	  for i= 1: size(x,1)
	    y=wav2aud(x(i,:),paras);
	    y=y.^(1/3);
	    cr=aud2cor_gab(y, rv, sv, gab_filters); %%%%%%%2D gabor filtering
	    crtemp1 = mean(abs(cr),3);%%%%%%%%MISSING ABS
	    save([dest_filename(1:end-3) '_' num2str(i) '.gaborFeat.mat'], 'crtemp1')

	  end
%	  cr1=mean(crtemp,3);
%	  save([dest_filename(1:end-3) 'gabmat'], 'cr1')
	  clear x y cr crtemp cr1 feat;
	else
	ds= 1;
%	  delete([dest_filename(1:end-3) 'gabmat']);
	end
      else
	disp(['already done' filename]);
      end
    end
  end
  
   
