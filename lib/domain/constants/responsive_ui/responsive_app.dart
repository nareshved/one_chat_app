import 'package:flutter/material.dart';

class ResponsiveApp extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveApp({super.key, required this.desktop, required this.mobile});
  // using media query get current platform screen width/height

  static Size mqResponsive(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  /// using layout builder get current platform screen width/height

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight > constraints.maxWidth) {
          return mobile;
        } else {
          return desktop;
        }
      },
    );
  }

  /// using orientiation builder
}
