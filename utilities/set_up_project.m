function set_up_project()
%set_up_project:  Configure the task for this project
%
%   Set up the task for the current project. This function is set to
%   Run at Startup.

%% Store user created variables for cleanup upon exit
    evalin('base', 'userVars = who;');

    %% Initialize Project variables

    evalin('base', 'InitSimulinkPlantVars;');
    evalin('base', 'InitPX4ControllerVars;');
    evalin('base', 'InitOnboardAlgorithmVars;');
    evalin('base', 'Init3DVisualizationVars;');

    %% Set up work folders
    project = simulinkproject;
    projectRoot = project.RootFolder;

    %% Store project created variables for cleanup upon exit
    evalin('base', 'setupAndUserVars = who;');

    myCacheFolder = fullfile(projectRoot, 'work','cache');
    myCodeFolder = fullfile(projectRoot,'work','code');

    Simulink.fileGenControl('set',...
                            'CacheFolder', myCacheFolder,...
                            'CodeGenFolder', myCodeFolder,...
                            'createDir', true)
end
