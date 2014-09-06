 cd ..
 load a
 clean = a; clean = clean(1:16000); 
 noise = wavread('cafe_n00_noise.wav');
 cd scripts/
 noiseSpeech = combineSNR(noise(1:16000), clean(1:16000), 0)
 paras = [10 4 0 0]
 addpath nsltools/
 clean = unitseq(clean);
 noiseSpeech = unitseq(noiseSpeech);
 loadload
 y = wav2aud(noiseSpeech, paras);
 yc = wav2aud(clean(1:16000), paras);
 rv=2.^[1:5];
 sv=2.^[-2:1:3];
 gab_filters_orig = create_filters(paras,rv,sv);
 cr=aud2cor_gab(yc,paras,rv,sv,gab_filters_orig); %%%%%%%2D gabor filtering
 crtemp1 = mean(abs(cr),3);%%%%%%%%MISSING ABS
 crTemplate = squeeze(crtemp1);
 size(cr)
bw1 = [1 : 5];
wt =  [0.8 : 0.1 : 1.2];
theta = [ -3*pi/180 : 1.5*pi/180 : 3*pi/180];
lb = ones(1,120);
ub = 5*ones(1, 120);
intCon = 1 : 240;
options = gaoptimset('CrossoverFrac',0.5,'PopulationSize',100,...
'StallGen',125,'Generations',150, 'UseParallel', 'always')
