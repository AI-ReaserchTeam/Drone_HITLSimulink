function launchSimulinkPlant
%
    project = simulinkproject;
    projectRoot = project.RootFolder;
    open_system(fullfile(projectRoot,'SimulinkPlant','UAV_Dynamics_Autopilot_Communication.slx'));
end
