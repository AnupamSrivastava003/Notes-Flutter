import 'package:flutter/material.dart';
import 'package:notes/components/popover.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile(
      {super.key,
      required this.text,
      required this.onDeletePressed,
      required this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7, bottom: 20, top: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
          title: Text(text),
          trailing: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => showPopover(
                  width: 100,
                  height: 100,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  context: context,
                  bodyBuilder: (context) => PopOver(onDeleteTap: onDeletePressed, onEditTap: onEditPressed,)),
            ),
          )),
    );
  }
}
