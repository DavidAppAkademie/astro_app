import 'package:astro_app/project/sub_classes/camera.dart';
import 'package:astro_app/project/sub_classes/telescope.dart';

class Project {
  final String name;
  final Camera camera;
  final Telescope telescope;

  Project({
    required this.name,
    required this.camera,
    required this.telescope,
  });

  @override
  String toString() {
    return 'Project: $name, $camera, $telescope';
  }
}
