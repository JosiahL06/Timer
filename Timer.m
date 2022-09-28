%Sets a timer using inputs of minutes and seconds
%If an arduino is connected, also activates a selected digital pin
clear;
clc;

arduinoStatus = input('Using Arduino? Y/N : ', 's');
if arduinoStatus == 'Y'
    a = arduino;
    connectedPin = input('Which digital pin do you want to activate?  ', 's');
    writeDigitalPin(a, connectedPin, 0);
end

timeMinutes = input("How many minutes?   ");
timeSeconds = input("How many seconds?   ");

timerDone = 0;
while timerDone == 0
    start = input('Start timer? Y/N : ', 's');
    if start == 'Y'
        pause((timeMinutes*60) + timeSeconds);
        disp('Done');

        if arduinoStatus == 'Y'
            writeDigitalPin(a,connectedPin,1);
        end

        timerDone = 1;
    elseif start ~= 'N'
        disp('Unknown input, please try again')
    end
    pause(1);
    fprintf("\n");
end