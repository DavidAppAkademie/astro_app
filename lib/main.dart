import 'package:astro_app/presentation/configuration_screen.dart';
import 'package:astro_app/project/configuration/configuration_steps.dart';
import 'package:astro_app/project/project.dart';
import 'package:astro_app/project/project_builder.dart';
import 'package:astro_app/project/sub_classes/camera.dart';
import 'package:astro_app/project/sub_classes/filter.dart';
import 'package:astro_app/project/sub_classes/telescope.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ProjectBuilderNotifier(),
      builder: (context, child) {
        return const App();
      },
    ),
  );
}

class ProjectBuilderNotifier extends ChangeNotifier {
  final ProjectBuilder _projectBuilder = ProjectBuilder();

  ProjectBuilder get projectBuilder => _projectBuilder;

  bool get isFullyConfigured => _projectBuilder.isFullyConfigured;
  void setName(String name) {
    _projectBuilder.name = name;
    notifyListeners();
  }

  void setCamera(Camera camera) {
    _projectBuilder.camera = camera;
    notifyListeners();
  }

  void setTelescope(Telescope telescope) {
    _projectBuilder.telescope = telescope;
    notifyListeners();
  }

  void setFilter(Filter filter) {
    _projectBuilder.filter = filter;
    notifyListeners();
  }

  void stepBack() {
    final prevStep = _projectBuilder.previousStep;
    if (prevStep != null) {
      switch (prevStep.runtimeType) {
        case const (NameStep):
          _projectBuilder.name = null;
        case const (CameraStep):
          _projectBuilder.camera = null;
        case const (TelescopeStep):
          _projectBuilder.telescope = null;
        case const (FilterStep):
          _projectBuilder.filter = null;
      }
      notifyListeners();
    }
  }

  Project build() {
    return _projectBuilder.build();
  }

  ConfigurationStep? get currentStep {
    return _projectBuilder.currentStep;
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConfigurationScreen(),
    );
  }
}
