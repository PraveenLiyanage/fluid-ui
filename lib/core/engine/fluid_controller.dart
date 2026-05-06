import 'package:flutter/material.dart';

class FluidController extends ChangeNotifier {
  bool _showInspector = false;
  bool get showInspector => _showInspector;

  void toggleInspector() {
    _showInspector = !_showInspector;
    notifyListeners();
  }

  static FluidController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<FluidControllerProvider>();
    return provider!.controller;
  }
}

class FluidControllerProvider extends InheritedNotifier<FluidController> {
  final FluidController controller;

  const FluidControllerProvider({
    super.key,
    required this.controller,
    required super.child,
  }) : super(notifier: controller);

  @override
  bool updateShouldNotify(FluidControllerProvider oldWidget) {
    return controller != oldWidget.controller;
  }
}
