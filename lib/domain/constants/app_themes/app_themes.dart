import 'package:flutter/material.dart';
import 'package:one_chat_app/domain/constants/app_colors/app_colors.dart';

var mlightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.lightPrimaryColor,
    surface: AppColors.lightBgColorSurfaceColor,
    secondaryContainer: AppColors.lightMsgBoxContainerColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "Outfit",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Outfit",
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: "Outfit",
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.lightPrimaryContainerColor,
  ),
);

// dark theme

var mDarkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Outfit",
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimaryColor,
    surface: AppColors.darkbgSurfaceColor,
    secondaryContainer: AppColors.darkChatMsgContainerContainerColor,
  ),
  appBarTheme: AppBarTheme(backgroundColor: AppColors.darkAppBarColor),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: "Outfit",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Outfit",
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: "Outfit",
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  ),
);























// final mDarkTheme = ThemeData(
// brightness: Brightness.dark,

// colorScheme: ColorScheme.fromSeed(
// seedColor: Color.fromRGBO(255, 87, 34, 1),


// ),

// );
