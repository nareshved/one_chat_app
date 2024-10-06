import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.dark_mode_rounded),
            title: Text("dark mode"),
          ),
          // ListTile(
          //   leading: Icon(Icons.logout),
          //   title: Text("log out"),
          //   onTap: () {
          //     FirebaseProvider.userLogOut();

          //   },
          // ),
        ],
      ),
    );
  }
}
