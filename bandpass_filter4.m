function[h4]=bandpass_filter4(Fs,N)

N1 = 3647;

        %--Passband edge frequency1 = 931  Hz-- 
        %--Passband edge frequency2 = 951  Hz-- 
        %--Transition width = 10Hz--
        %--stopband attenuation > 50 dB--
        f1 = 931./Fs;
        f2 = 951./Fs;
        omegac1 = 2.*pi.*f1;
        omegac2 = 2.*pi.*f2;
        m = 1;
        for n = -(N1-1)/2:(N1-1)/2
            if n==0
                hD4(m)=2.*(f2-f1);
            else
                hD4(m)=(2*f2*sin(n.*omegac2)./(n.*omegac2))-(2*f1*sin(n.*omegac1)./(n.*omegac1));
            end;
        m = m+1;
        end;
   
       

        j = 1;
        for n=-(N1-1)/2:(N1-1)/2
            w4(j)=0.54+0.46*cos(2*pi*n/N1);
        j = j+1;
        end;
h4 = hD4.*w4;
end
        
