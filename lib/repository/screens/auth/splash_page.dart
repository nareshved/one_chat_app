import 'dart:async';
import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:one_chat_app/domain/constants/assets_path/assets_path.dart';

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
        }

        Navigator.pushReplacementNamed(context, navigateTo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Theme.of(context).colorScheme.primary,

      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeIn(
              animate: true,
              duration: Duration(seconds: 3),
              child: Image.asset(
                ImagesPathProvider.appLogoRed,
                //   width: 250,
                height: 100, fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
