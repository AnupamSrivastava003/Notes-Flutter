import 'package:flutter/material.dart';

class TechUsed extends StatelessWidget {
  const TechUsed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ISAR Database"),
            Text("Dart"),
            Text("Flutter Provider"),
            Text("popover"),
            Text("google_fonts"),
          ],
        ),
      ),
    );
  }
}