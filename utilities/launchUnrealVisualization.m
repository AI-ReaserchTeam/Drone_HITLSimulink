function launchUnrealVisualization
%

    project = simulinkproject;
    projectRoot = project.RootFolder;
    open_system(fullfile(projectRoot,'visualization','Unreal_3DVisualization.slx'));
end
