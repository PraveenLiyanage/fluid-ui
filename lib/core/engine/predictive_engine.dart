import 'package:flutter/material.dart';

class PredictiveEngine {
  /// Predicts if a layout change is needed before an overflow occurs.
  /// Enterprise feature for proactive UI management.
  static bool predictOverflow({
    required double currentWidth,
    required double childCount,
    required double minChildWidth,
  }) {
    final availableSpace = currentWidth / childCount;
    // Buffer for predictive analysis (10% safety margin)
    return availableSpace < (minChildWidth * 1.1);
  }

  /// Calculates a 'Density Index' for enterprise reporting.
  static double getDensityIndex(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1920) return 0.2; // Low density
    if (width > 1200) return 0.5; // Medium density
    return 0.9; // High density
  }
}
