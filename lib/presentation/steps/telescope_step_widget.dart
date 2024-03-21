import 'package:astro_app/main.dart';
import 'package:astro_app/project/sub_classes/telescope.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelescopeStepWidget extends StatefulWidget {
  final List<Telescope> availableTelescopes;
  const TelescopeStepWidget({super.key, required this.availableTelescopes});
  @override
  TelescopeStepWidgetState createState() => TelescopeStepWidgetState();
}

class TelescopeStepWidgetState extends State<TelescopeStepWidget> {
  Telescope? telescope;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<Telescope>(
          value: telescope,
          onChanged: (Telescope? c) {
            setState(() {
              telescope = c;
            });
          },
          items: widget.availableTelescopes
              .map(
                (telescope) => DropdownMenuItem(
                  value: telescope,
                  child: Text(telescope.toString()),
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
              onPressed: telescope != null
                  ? () {
                      context
                          .read<ProjectBuilderNotifier>()
                          .setTelescope(telescope!);
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
