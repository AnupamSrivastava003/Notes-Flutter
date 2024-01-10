import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/technology_used.dart';
import 'package:notes/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal : 25),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 16),
                ),
                CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkNode,
                    onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme())
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TechUsed()));
            },
            child: Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Technology Used",
                    style: TextStyle(fontSize: 16),
                  ),
          
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}