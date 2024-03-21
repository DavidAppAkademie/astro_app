import 'package:astro_app/main.dart';
import 'package:astro_app/project/sub_classes/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraStepWidget extends StatefulWidget {
  final List<Camera> availableCameras;
  const CameraStepWidget({super.key, required this.availableCameras});
  @override
  CameraStepWidgetState createState() => CameraStepWidgetState();
}

class CameraStepWidgetState extends State<CameraStepWidget> {
  Camera? camera;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<Camera>(
          value: camera,
          onChanged: (Camera? c) {
            setState(() {
              camera = c;
            });
          },
          items: widget.availableCameras
              .map(
                (camera) => DropdownMenuItem(
                  value: camera,
                  child: Text(camera.toString()),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: camera != null
                  ? () {
                      context.read<ProjectBuilderNotifier>().setCamera(camera!);
                    }
                  : null,
              child: const Text("Continue"),
            ),
            const SizedBox(
              width: 16,
            ),
            TextButton(
              onPressed: () {
                context.read<ProjectBuilderNotifier>().stepBack();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ],
    );
  }
}
