loadload; close;
paras = [10 4 0 0]
rv=2.^[1:5];
sv=2.^[-2:3];
clean = readnist('../paraSearchGA/SI1000.WAV');
noise = wavread('../paraSearchGA/cafe_n00_noise.wav');
noiseSpeech = combineSNR(noise(1:length(clean)), clean, 0);
clean = unitseq(clean);
clean = wind(clean,16000);
clean = clean(1,:);
noiseSpeech = unitseq(noiseSpeech);
noiseSpeech = wind(noiseSpeech,16000);
noiseSpeech = noiseSpeech(1,:);
audClean = wav2aud(clean, paras);
audNoisySpeech = wav2aud(noiseSpeech, paras);
cd ..
gab_filters = create_filters(paras,rv,sv);
cr=aud2cor_gab(audClean, rv, sv, gab_filters); %%%%%%%2D gabor filtering
crtemp1 = mean(abs(cr),3);%%%%%%%%MISSING ABS
crTemplate1 = squeeze(crtemp1);
