import 'package:flutter/material.dart';

class PopOver extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  const PopOver(
      {super.key, required this.onDeleteTap, required this.onEditTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // edit
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: const Center(child: Text("Edit")),
          ),
        ),

        // delete
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: const Center(child: Text("Delete")),
          ),
        ),
      ],
    );
  }
}
