import 'package:flutter/material.dart';

enum PriorityLevel { low, medium, high }

class FluidPriority extends StatelessWidget {
  final Widget child;
  final PriorityLevel level;
  final bool hideOnMobile;

  const FluidPriority({
    super.key,
    required this.child,
    this.level = PriorityLevel.medium,
    this.hideOnMobile = false,
  });

  factory FluidPriority.high({required Widget child}) =>
      FluidPriority(child: child, level: PriorityLevel.high);

  factory FluidPriority.low({required Widget child, bool hideOnMobile = true}) =>
      FluidPriority(child: child, level: PriorityLevel.low, hideOnMobile: hideOnMobile);

  @override
  Widget build(BuildContext context) {
    if (hideOnMobile) {
      final width = MediaQuery.of(context).size.width;
      if (width < 600) return const SizedBox.shrink();
    }
    return child;
  }
}
