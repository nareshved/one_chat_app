import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_chat_app/data/bloc/chat/register_bloc.dart';
import 'package:one_chat_app/data/bloc/users/user_bloc.dart';
import 'package:one_chat_app/data/firebase/firebase_provider.dart';
import 'package:one_chat_app/data/theme_provider/theme_provider.dart';
import 'package:one_chat_app/domain/constants/app_themes/app_themes.dart';
import 'package:one_chat_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'repository/widgets/page_routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkThemeProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChatBloc(firebaseProvider: FirebaseProvider()),
          ),
          BlocProvider(
            create: (context) => UserBloc(firebaseProvider: FirebaseProvider()),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => DarkThemeProvider(),
          // )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.routes,
        themeMode: ThemeMode.dark,

        // themeMode: context.watch<DarkThemeProvider>().themeValue
        //     ? ThemeMode.dark
        //     : ThemeMode.light,
        title: 'One Chat',
        theme: mlightTheme,
        darkTheme: ThemeData.dark(),

        //    themeMode: ThemeMode.dark,
        // home: const BottomNavBarHome(),
      ),
    );
  }
}
