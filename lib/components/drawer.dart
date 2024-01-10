import 'package:flutter/material.dart';
import 'package:notes/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [

          //header
          DrawerHeader(child: Image.asset("assets/notebook.png", height: 80, width: 80,)),

          SizedBox(height: 30,),

          //List tiles
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: Text("H O M E", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                leading: const Icon(Icons.home),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                title: Text("S E T T I N G S", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                leading: const Icon(Icons.home),
              ),
            ),
          ),


        ],
      ),
    );
  }
}