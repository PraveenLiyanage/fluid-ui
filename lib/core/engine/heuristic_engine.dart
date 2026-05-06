// lib/core/engine/heuristic_engine.dart

enum WidgetComplexity { low, medium, high }

class HeuristicEngine {
  /// AI-assisted calculation of optimal columns based on viewport and widget complexity.
  static int getSmartColumnCount({
    required double maxWidth,
    required WidgetComplexity complexity,
  }) {
    // Base column logic
    int columns = 1;
    if (maxWidth > 1600) {
      columns = 5;
    } else if (maxWidth > 1200) {
      columns = 4;
    } else if (maxWidth > 900) {
      columns = 3;
    } else if (maxWidth > 600) {
      columns = 2;
    }

    // Heuristic Adjustment: 
    // If complexity is high, we aggressively reduce column count to prevent squeezing/overflow.
    if (complexity == WidgetComplexity.high) {
      if (maxWidth < 1440) columns = (columns - 1).clamp(1, 5);
      if (maxWidth < 1100) columns = (columns - 1).clamp(1, 5);
    } else if (complexity == WidgetComplexity.medium) {
      if (maxWidth < 900) columns = (columns - 1).clamp(1, 5);
    }

    return columns;
  }
}
