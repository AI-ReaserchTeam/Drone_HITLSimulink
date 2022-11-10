%

%   Copyright 2021-2022 The MathWorks, Inc.


%% UAV Dynamics Constants
%Based on the quadcopter model used in jMAVSim

Ixx = 0.005; %Kgm^2
Iyy = 0.005;
Izz = 0.009;

inertia = diag([Ixx, Iyy, Izz]);

mass = 0.8; %Kg
g = 9.81; %m/s^2

armLength = 0.33/2; % length of Arm measured from center in m

rotorThrustMax = 4; %N

rotorTorqueMax = 0.05 ;%Nm

rotorTimeConst = 0.050 ;% time constant of rotor (motor + propeller)

%rotorOffset = [0 0 0]; % Rotors position offsets from Gravity center

dragCoeffMov = 0.01; %drag coefficient for linear motion of quadcopter
windVel = [0 0 0]';

% Contact model
contact.translation.spring = 3100;
contact.translation.damper = 100;
contact.translation.friction = 0.5;
contact.translation.vd = 0.02;
contact.translation.maxFriction = 20;
contact.translation.maxNormal = 80;

contact.rotation.spring = 2;
contact.rotation.damper = 1;
contact.rotation.friction = 0.03;
control.rotation.maxMoment = 0.1;
control.rotation.friction = 0.025;
control.rotation.vd = 0.2;

% Initial states
init.equilibriumZ =  mass*g/contact.translation.spring;
init.posNED = [0, 0, init.equilibriumZ]; % m
init.vb = [0 0 0]'; %m/s
init.euler = [0, 0, 0]'; %Roll Pitch Yaw Rads
init.angRates = [0, 0, 0]; %rad/s

%Computed from above values
rotorPositions = zeros(3,4);
axisD = armLength/sqrt(2);
rotorPositions(:,1) = [axisD, axisD, 0]';
rotorPositions(:,2) = [-axisD, -axisD, 0]';
rotorPositions(:,3) = [+axisD, -axisD, 0]';
rotorPositions(:,4) = [-axisD, axisD, 0]';
rotorDir = [-1, -1, 1, 1]; %rotation direction. +ve = clockwise

%Reference location: Zurich
% This is the home position also

ref_lat = 473977420e-7;
ref_lon = 85455940e-7;
ref_height = 488;

%% UAV Dynamics Data Serialization Constants

%Gain to convert m to mm
m_to_mm = 1000;

%Gain to convert uT to Gauss
uT_to_gauss = 0.01;

%Gain to convert m/s^2 to mg
ms2_to_mg = (1/9.80665)*1000;

%Gain to convert m/s to cm/s
ms_to_cms = 100;

% Maximum Serial data read size from Pixhawk
MAVLink_Input_Read_Size = 1024;

% Sample Time of Plant and Controller (100 Hz)
SampleTime = 0.01;
