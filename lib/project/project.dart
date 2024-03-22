import 'package:astro_app/project/sub_classes/camera.dart';
import 'package:astro_app/project/sub_classes/filter.dart';
import 'package:astro_app/project/sub_classes/telescope.dart';

class Project {
  final String name;
  final Camera camera;
  final Telescope telescope;
  final Filter filter;

  Project({
    required this.name,
    required this.camera,
    required this.telescope,
    required this.filter,
  });

  @override
  String toString() {
    return 'Project: $name, $camera, $telescope, ${filter.name}';
  }
}
