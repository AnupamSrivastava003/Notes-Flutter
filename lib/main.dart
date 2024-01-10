import 'package:flutter/material.dart';
import 'package:notes/models/notes_database.dart';
import 'package:notes/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:notes/pages/home_page.dart';

void main() async {
  //initializing note database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteDatabase()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
