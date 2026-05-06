import 'package:flutter/material.dart';
import 'fluid_controller.dart';
import '../../widgets/adaptive_inspector.dart';

class FluidApp extends StatefulWidget {
  final Widget child;

  const FluidApp({
    super.key,
    required this.child,
  });

  @override
  State<FluidApp> createState() => _FluidAppState();
}

class _FluidAppState extends State<FluidApp> {
  late final FluidController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FluidController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluidControllerProvider(
      controller: _controller,
      child: AdaptiveInspector(
        child: widget.child,
      ),
    );
  }
}
