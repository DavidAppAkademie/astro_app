import 'package:astro_app/project/configuration/configuration_steps.dart';
import 'package:astro_app/project/project.dart';
import 'package:astro_app/project/sub_classes/camera.dart';
import 'package:astro_app/project/sub_classes/filter.dart';
import 'package:astro_app/project/sub_classes/telescope.dart';

class ProjectBuilder {
  String? name;
  Camera? camera;
  Telescope? telescope;
  Filter? filter;
  // chain of responsibility
  // steps in here need to be in order of the configuration steps
  List<ConfigurationStep> get _steps => [
        NameStep(),
        CameraStep(),
        TelescopeStep(),
        FilterStep(),
      ];

  /// Returns the previous configuration step.
  /// Returns null if the current step is the first step.
  ConfigurationStep? get previousStep {
    for (var i = 1; i < _steps.length; i++) {
      if (_steps[i].isCurrentStep(this)) {
        return _steps[i - 1];
      }
    }
    return null;
  }

  /// Returns the current configuration step.
  /// Returns null if no step is the current step.
  ConfigurationStep? get currentStep {
    for (final step in _steps) {
      if (step.isCurrentStep(this)) {
        return step;
      }
    }
    return null;
  }

  ProjectBuilder setName(String name) {
    name = name;
    return this;
  }

  ProjectBuilder setCamera(Camera camera) {
    camera = camera;
    return this;
  }

  ProjectBuilder setTelescope(Telescope telescope) {
    telescope = telescope;
    return this;
  }

  ProjectBuilder setFilter(Filter filter) {
    filter = filter;
    return this;
  }

  bool get isFullyConfigured =>
      name != null && camera != null && telescope != null && filter != null;

  Project build() {
    if (!isFullyConfigured) {
      throw Exception('Project is not fully configured.');
    }
    return Project(
        name: name!, camera: camera!, telescope: telescope!, filter: filter!);
  }
}
