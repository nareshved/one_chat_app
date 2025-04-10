import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_chat_app/data/bloc/chat/register_bloc.dart';
import 'package:one_chat_app/data/bloc/users/user_bloc.dart';
import 'package:one_chat_app/data/firebase/firebase_provider.dart';
import 'package:one_chat_app/domain/constants/app_themes/app_themes.dart';

import 'repository/widgets/page_routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ChatBloc(firebaseProvider: FirebaseProvider()),
    ),
    BlocProvider(
      create: (context) => UserBloc(firebaseProvider: FirebaseProvider()),
    )
  ], child: const MyApp()));
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
        title: 'One Chat',
        theme: mlightTheme,
        darkTheme: mDarkTheme,
        //    themeMode: ThemeMode.dark,
        // home: const BottomNavBarHome(),
      ),
    );
  }
}
