import 'package:flutter/material.dart';
import '../core/engine/fluid_controller.dart';
import '../core/breakpoints/fluid_breakpoints.dart';

class AdaptiveInspector extends StatelessWidget {
  final Widget child;

  const AdaptiveInspector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final controller = FluidController.of(context);

    return Stack(
      children: [
        child,
        if (controller.showInspector)
          Positioned(
            bottom: 20,
            right: 20,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.85),
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 280,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FLUID INSPECTOR',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.2,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white, size: 16),
                          onPressed: controller.toggleInspector,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white24),
                    _buildStat('Width', '${MediaQuery.of(context).size.width.toStringAsFixed(0)}px'),
                    _buildStat('Breakpoint', _getBreakpointName(context)),
                    _buildStat('Device', _getDeviceType(context)),
                    const SizedBox(height: 8),
                    const Text(
                      'AI HEURISTICS ACTIVE',
                      style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  String _getBreakpointName(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < FluidBreakpoints.mobile) return 'Mobile';
    if (w < FluidBreakpoints.tablet) return 'Tablet';
    if (w < FluidBreakpoints.desktop) return 'Desktop';
    return 'Ultra-Wide';
  }

  String _getDeviceType(BuildContext context) {
    if (FluidBreakpoints.isMobile(context)) return 'Handheld';
    if (FluidBreakpoints.isTablet(context)) return 'Tablet / Small Laptop';
    return 'Workstation';
  }
}
