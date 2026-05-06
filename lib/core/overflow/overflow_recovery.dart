import 'package:flutter/material.dart';

class OverflowRecovery extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const OverflowRecovery({
    super.key,
    required this.children,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // A simple implementation of overflow recovery using Wrap
        // In a real engine, this would be more proactive in measuring children
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: children,
        );
      },
    );
  }
}
