import 'package:astro_app/common/beautiful_text_field.dart';
import 'package:astro_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameStepWidget extends StatefulWidget {
  const NameStepWidget({super.key});
  @override
  NameStepWidgetState createState() => NameStepWidgetState();
}

class NameStepWidgetState extends State<NameStepWidget> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BeautifulTextField(
          controller: _controller,
          labelText: 'asdasd',
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ProjectBuilderNotifier>().setName(_controller.text);
          },
          child: const Text("Continue"),
        ),
      ],
    );
  }
}
