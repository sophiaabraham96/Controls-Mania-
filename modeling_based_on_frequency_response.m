clear all; 
clear all

time = 0; % in seconds
dt = 0.001; % increment of time added at each loop

% system parameters from derived transfer function
num = 354813; %num of transfer function 
mass = 1;  % kg
B = 56.91;  % N-s/m
K = 10000;  % N/m
freq = 100; %frequency in rad/sec
func = num*sin(freq*dt); %sine function 

% index for keeping track of where we are in the array
count = 2;

% initial conditions
xdd(1)=0; % second derivative of x (position)
xd(1)=0; % first derivative of x (position)
x(1)=0; % position
time(1)=0;
f(1)=func;%initializing with sine function 

while time(count-1) < 2
    xdd(count) = (f(count-1)-K*x(count-1)-B*xd(count-1))/mass;
    xd(count) = xd(count-1) + xdd(count)*dt;
    x(count) = x(count-1) + xd(count)*dt;

    % external force
    f(count)=num*sin(freq*time(count-1));
    
    time(count) = time(count-1) + dt;
    count = count + 1;

end

plot(time,x,'m')
grid
xlabel('Time (seconds)')
ylabel('Amplitude (meters)')
title('Matlab Model')




