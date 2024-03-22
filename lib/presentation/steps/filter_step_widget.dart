import 'package:astro_app/main.dart';
import 'package:astro_app/project/sub_classes/filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterStepWidget extends StatefulWidget {
  final List<Filter> availableFilters;
  const FilterStepWidget({super.key, required this.availableFilters});
  @override
  FilterStepWidgetState createState() => FilterStepWidgetState();
}

class FilterStepWidgetState extends State<FilterStepWidget> {
  Filter? filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<Filter>(
          value: filter,
          onChanged: (Filter? c) {
            setState(() {
              filter = c;
            });
          },
          items: widget.availableFilters
              .map(
                (filter) => DropdownMenuItem(
                  value: filter,
                  child: Text(filter.name.toString()),
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
              onPressed: filter != null
                  ? () {
                      context.read<ProjectBuilderNotifier>().setFilter(filter!);
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
