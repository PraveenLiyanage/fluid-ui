import 'package:flutter/material.dart';

class FluidTypography {
  static double getFontSize(BuildContext context, {required double baseSize}) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return baseSize * 0.85;
    if (width < 1024) return baseSize;
    if (width < 1440) return baseSize * 1.1;
    return baseSize * 1.2;
  }

  static TextStyle responsiveStyle(BuildContext context, TextStyle baseStyle) {
    return baseStyle.copyWith(
      fontSize: getFontSize(context, baseSize: baseStyle.fontSize ?? 14.0),
    );
  }
}
