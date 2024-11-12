import 'package:flutter/material.dart';
import 'package:one_chat_app/domain/constants/app_colors/app_colors.dart';


var mlightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: backgroundColor,
    primary: primaryColor,
    onSurface: onBackgroundTextColor,
    primaryContainer: primaryColor,
    onPrimaryContainer: onPrimaryContainerLableTextColor,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: onBackgroundTextColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: onBackgroundTextColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: onBackgroundTextColor,
    ),
    bodySmall: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: onBackgroundTextColor,
    ),
    labelMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: onPrimaryContainerColor,
    ),
  ),
);

// dark theme

var mDarkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: darkBgColor,
      primary: darkPrimaryColor,
      onSurface: darkOnBackground,
      primaryContainer: darkPrimaryContaainer,
      // primaryContainer: darkSecondryColor,

      onPrimaryContainer: darkOnPrimaryContainerColor,
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: darkPrimaryContaainer,
        surfaceTintColor: darkPrimaryContaainer),

    // text field theme
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: darkBgColor,
      border: InputBorder.none,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: darkOnPrimaryContainerColor,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: darkOnBackground,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: darkOnBackground,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: darkOnBackground,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: darkOnBackground,
      ),
      labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: onPrimaryContainerColor,
      ),
    ));

























// final mDarkTheme = ThemeData(
// brightness: Brightness.dark,

// colorScheme: ColorScheme.fromSeed(
// seedColor: Color.fromRGBO(255, 87, 34, 1),


// ),

// );
