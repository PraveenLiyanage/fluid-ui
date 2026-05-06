import 'package:flutter/material.dart';

class LayoutAnalyzer {
  static bool detectOverflowRisk(BoxConstraints constraints, double expectedWidth) {
    return expectedWidth > constraints.maxWidth;
  }

  static double calculateDensity(BoxConstraints constraints) {
    // Returns a value from 0 to 1 representing how "tight" the layout is
    final area = constraints.maxWidth * constraints.maxHeight;
    if (area == double.infinity) return 0.5;
    // Arbitrary scaling for demo purposes
    return (area / (1920 * 1080)).clamp(0.0, 1.0);
  }
}
