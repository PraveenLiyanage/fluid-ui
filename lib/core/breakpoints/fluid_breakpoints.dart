import 'package:flutter/material.dart';

class FluidBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
  static const double ultraWide = 1920;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobile;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < tablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet;

  static bool isUltraWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= ultraWide;
}
