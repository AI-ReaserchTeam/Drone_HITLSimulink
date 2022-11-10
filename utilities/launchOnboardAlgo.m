function launchOnboardAlgo
%

    project = simulinkproject;
    projectRoot = project.RootFolder;
    open_system(fullfile(projectRoot,'onboard_algorithm','Onboard_Autopilot_Communication.slx'));
end
