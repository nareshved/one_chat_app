import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:one_chat_app/repository/screens/auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/page_routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () async {
        var prefs = await SharedPreferences.getInstance();
        String? myKey = prefs.getString(LoginPageState.loginPrefsKey);

        log("splash page firebase uid : $myKey");

        String navigateTo = AppRoutes.loginScreen;

        if (myKey != null && myKey != "") {
          navigateTo = AppRoutes.homeNavBarScreen;

          /// const remove
        }

        Navigator.pushReplacementNamed(context, navigateTo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.light_mode, size: 42.0, color: Colors.white),
            Text(
              "One Chat",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
