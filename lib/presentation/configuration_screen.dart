import 'package:astro_app/main.dart';
import 'package:astro_app/presentation/steps/camera_step_widget.dart';
import 'package:astro_app/presentation/steps/filter_step_widget.dart';
import 'package:astro_app/presentation/steps/name_step_widget.dart';
import 'package:astro_app/presentation/steps/telescope_step_widget.dart';
import 'package:astro_app/project/configuration/configuration_steps.dart';
import 'package:astro_app/project/project_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<ProjectBuilderNotifier>().isFullyConfigured) {
      return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              final project = context.read<ProjectBuilderNotifier>().build();
              debugPrint(project.toString());
            },
            child: const Text("Build Project"),
          ),
        ),
      );
    } else {
      final step = context.watch<ProjectBuilderNotifier>().currentStep!;
      final projectBuilder =
          context.watch<ProjectBuilderNotifier>().projectBuilder;
      return Scaffold(
        body: Center(
          child: _getStepWidget(step, projectBuilder),
        ),
      );
    }
  }

  Widget _getStepWidget(ConfigurationStep step, ProjectBuilder projectBuilder) {
    switch (step.runtimeType) {
      case const (NameStep):
        return const NameStepWidget();
      case const (CameraStep):
        return CameraStepWidget(
          availableCameras:
              (step as CameraStep).getAvailableCameras(projectBuilder),
        );
      case const (FilterStep):
        return FilterStepWidget(
          availableFilters:
              (step as FilterStep).getAvailableFilters(projectBuilder),
        );
      case const (TelescopeStep):
      default:
        return TelescopeStepWidget(
          availableTelescopes:
              (step as TelescopeStep).getAvailableTelescopes(projectBuilder),
        );
    }
  }
}
