function encoderdsp
%DSP Project Encoder
%Tanvir Mudhar
%November 6 2014
%This program will ask the user for an input,.... (will do the rest of the
%desc later, too tired.


%Asks for the sequence from the use the converts to string for use by
%forloop
prompt ='what is your sequence? ';
sequence =input(prompt,'s')
num = sequence;
%frequencies
List = [100 200 300; 100 200 400; 100 200 500; 100 150 300; 100 150 400; 
         100 150 500; 75 200 300; 75 200 400; 75 200 500; 75 150 300];
 %Initial Values
 Sampling = 8000; % sampling for sound must be atleast 8000
 duration = 50e-3; % duration specified by prof
 interval = 50e-3; % interval specified by prof
 
 Ns = floor(duration*Sampling);  % signal
 
 N0 = floor(interval*Sampling);  % silence period
 
 LengthN = length(num); % number of digits
  
 Signal = zeros(N0,1);   % Fill Array with Zeros
% generate signal for number number
     for i = 1: LengthN
         k = 1:Ns;
         number = str2double(num(i)); % convert string to doubles
         %Looks at the valyes in the List above to see which freqs need to
         %be added for the tone.
         Freq1 = List(number+1,1); Freq2 = List(number+1,2);Freq3 = List(number+1,3);
         ToneSignal =(1+ rand(1))*(sin(2.*pi.*Freq1.*k./Sampling) + sin(2.*pi.*Freq2.*k./Sampling) + sin(2.*pi.*Freq3.*k./Sampling));  % maximal amplitude is 2
         %Creates a matrix to store all signals computed above into a
         %matrix, ":" operant makes the rows of the maxtrix columbs. and
         %then adds a zeros matrix to fill the "intervals".
         Signal = [Signal; ToneSignal(:); zeros(N0,1)];
     end
%create hamonic noise:
Light_Noise = Signal + 0.05 * normrnd(0,1,length(Signal),1);
%create White Noise to Signal:
Heavy_Noise = awgn(Signal,15);

% Plot all signals Generated:
        figure
        
        subplot(3,2,1) % first subplot
        plot(Signal)
        title('Signal (Time)')

        subplot(3,2,2) % second subplot
        plot(abs(fft(Signal)))
        title('FFT of Signal')

        subplot(3,2,3) % third subplot
        plot(Light_Noise)
        title('Signal with Noise (Time)')

        subplot(3,2,4) % fourth subplot
        plot(abs(fft(Light_Noise)))
        title('FFT of Noisy Signal')
        
        subplot(3,2,5) % Fifth subplot
        plot(Heavy_Noise);
        title('Heavy Noise Signal')

        subplot(3,2,6) % Sixth subplot
        plot(abs(fft(Heavy_Noise)));
        title('FFT of Heavy Noise Signal')
        
  %Generate Sound for all signals 1) Normal, 2) Noisy 3) heavily Noisy
        pause;
        sound(Signal, Sampling)
        pause;
        sound(Light_Noise, Sampling)
        pause;
        sound(Heavy_Noise, Sampling)
        

 
 