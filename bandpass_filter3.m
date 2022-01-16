function[h3]=bandpass_filter3(Fs,N)

N1 = 3647;

        %--Passband edge frequency1 = 842  Hz-- 
        %--Passband edge frequency2 = 862  Hz-- 
        %--Transition width = 10Hz--
        %--stopband attenuation > 50 dB--
        f1 = 842/Fs;
        f2 = 862/Fs;
        omegac1 = 2.*pi.*f1;
        omegac2 = 2.*pi.*f2;
        m = 1;
        for n = -(N1-1)/2:(N1-1)/2
            if n==0
                hD3(m)=2.*(f2-f1);
            else
                hD3(m)=(2*f2*sin(n.*omegac2)./(n.*omegac2))-(2*f1*sin(n.*omegac1)./(n.*omegac1));
            end;
        m = m+1;
        end;
   
       

        j = 1;
        for n=-(N1-1)/2:(N1-1)/2
            w3(j)=0.54+0.46*cos(2*pi*n/N1);
        j = j+1;
        end;
h3 = hD3.*w3
end
        