import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_chat_app/data/firebase/firebase_provider.dart';
import 'package:one_chat_app/data/theme_provider/theme_provider.dart';
import 'package:one_chat_app/repository/screens/auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode_rounded),
            title: Text("dark mode"),
            trailing: Switch.adaptive(
              value: context.watch<DarkThemeProvider>().themeValue,
              onChanged: (value) {
                context.read<DarkThemeProvider>().themeValue = value;
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("log out"),
            onTap: () async {
              await FirebaseProvider.logOut;
              var signOutPrefs = await SharedPreferences.getInstance();
              signOutPrefs.setString(LoginPageState.loginPrefsKey, "");

              log("user log out success");

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  )).then((a) {
                log("user log out $a");
              });
            },
          ),
        ],
      ),
    );
  }
}
