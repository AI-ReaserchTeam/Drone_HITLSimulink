function launchController
%

    project = simulinkproject;
    projectRoot = project.RootFolder;
    open_system(fullfile(projectRoot,'controller','Quadcopter_ControllerWithNavigation.slx'));
end
