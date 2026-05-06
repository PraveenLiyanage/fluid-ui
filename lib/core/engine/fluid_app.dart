import 'package:flutter/material.dart';

class FluidApp extends StatelessWidget {
  final Widget child;

  const FluidApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // In the future, this can provide global state or services
    return child;
  }
}
