%Timer.m
%   Author: Josiah Laakkonen
%   Sets a timer using inputs of minutes and seconds
%   If an arduino is connected, also activates a selected digital pin
clear;
clc;

%asks user if they have an arduino connected. If so, they can choose a digital
%pin to turn on when the timer goes off
arduinoStatus = input('Using Arduino? Y/N : ', 's');
if arduinoStatus == 'Y'
    a = arduino;
    connectedPin = input('Which digital pin do you want to activate?  ', 's');
    writeDigitalPin(a, connectedPin, 0);
end

%asks user to input the times for the timer, in minutes and seconds
timeMinutes = input("How many minutes?   ");
timeSeconds = input("How many seconds?   ");

%setting the status of the timer, as of now it is not done
timerDone = 0;

%as long as the timer is not done, asks the user if they want to start the timer
while timerDone == 0
    start = input('Start timer? Y/N : ', 's');
    if start == 'Y'
        %starts the timer, displaying done when it is done. If an arduino is connected,
        %activates the selected digital pin
        pause((timeMinutes*60) + timeSeconds);
        disp('Done');

        if arduinoStatus == 'Y'
            writeDigitalPin(a,connectedPin,1);
        end
        %sets the status of the timer to done, ending the program
        timerDone = 1;
    %lets user know they entered an invalid input and asks again
    elseif start ~= 'N'
        disp('Unknown input, please try again')
    %pauses for a second and asks again; should only activate if the user enters 'N'
    else
        pause(1);
        fprintf("\n");
    end
end