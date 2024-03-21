import 'package:astro_app/project/project_builder.dart';
import 'package:astro_app/project/sub_classes/camera.dart';
import 'package:astro_app/project/sub_classes/telescope.dart';

abstract class ConfigurationStep {
  bool isCurrentStep(ProjectBuilder projectBuilder);
}

class NameStep implements ConfigurationStep {
  @override
  bool isCurrentStep(ProjectBuilder projectBuilder) {
    if (projectBuilder.name == null) {
      return true;
    } else {
      return false;
    }
  }
}

class CameraStep implements ConfigurationStep {
  @override
  bool isCurrentStep(ProjectBuilder projectBuilder) {
    if (projectBuilder.camera == null) {
      return true;
    } else {
      return false;
    }
  }

  List<Camera> getAvailableCameras(ProjectBuilder projectBuilder) {
    // decide which cameras are available based on the previous selections
    return Camera.values;
  }
}

class TelescopeStep implements ConfigurationStep {
  @override
  bool isCurrentStep(ProjectBuilder projectBuilder) {
    if (projectBuilder.telescope == null) {
      return true;
    } else {
      return false;
    }
  }

  List<Telescope> getAvailableTelescopes(ProjectBuilder projectBuilder) {
    // decide which telescopes are available based on the previous selections
    final selectedCamera = projectBuilder.camera!;
    if (selectedCamera == Camera.dslr) {
      return Telescope.values;
    } else {
      return [Telescope.refractor];
    }
  }
}
