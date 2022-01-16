function      [NUM] = filter2(in)

Fs = 44100;  % Sampling Frequency
N = 0:3000;

%-------Get Filter Coeficient by using function-------
[h1] = bandpass_filter1(Fs,N);
[h2] = bandpass_filter2(Fs,N);
[h3] = bandpass_filter3(Fs,N);
[h4] = bandpass_filter4(Fs,N);
[h5] = bandpass_filter5(Fs,N);
[h6] = bandpass_filter6(Fs,N);
[h7] = bandpass_filter7(Fs,N);

%------Filtering-----
L1=filter(h1,1,in);
L2=filter(h2,1,in);
L3=filter(h3,1,in);
L4=filter(h4,1,in);

H1=filter(h5,1,in);
H2=filter(h6,1,in);
H3=filter(h7,1,in);


for i=1:4
tex=sprintf('g=FFTsig(L%d,Fs);',i);
eval(tex);
[p q]=max(g);
freq = (q*Fs)/length(g);
low(i,:)=[p freq];
end
[a b]=max(low(:,1));
lowf=low(b,2);


for j=1:3
tex=sprintf('g=FFTsig(H%d,Fs);',j);
eval(tex);
[p q]=max(g);
freq = (q*Fs)/length(g);
hi(j,:)=[p freq];
end
[a b]=max(hi(:,1));
hif=hi(b,2);


b=20;
a=40;
if((lowf<697+b)&&(hif<1209+b)&&(hif>1209-b))
    NUM = '1';
elseif((lowf<697+b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '2';
elseif((lowf<697+b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '3';
elseif((lowf<770+b)&&(lowf>770-b)&&(hif<1209+a)&&(hif>1209-a))
    NUM = '4';
elseif((lowf<770+b)&&(lowf>770-b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '5';
elseif((lowf<770+b)&&(lowf>770-b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '6';
elseif((lowf<852+b)&&(lowf>852-b)&&(hif<1209+a)&&(hif>1209-a))
    NUM = '7';
elseif((lowf<852+b)&&(lowf>852-b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '8';
elseif((lowf<852+b)&&(lowf>852-b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '9';
elseif((lowf<941+b)&&(lowf>941-b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '0';
elseif((lowf<941+b)&&(lowf>941-b)&&(hif<1209+a)&&(hif>1209-a))
    NUM = '*';
elseif((lowf<941+b)&&(lowf>941-b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '#';
else
    NUM = '_';
end

NUM=uint8(NUM);
    



end


