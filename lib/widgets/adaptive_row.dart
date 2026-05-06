import 'package:flutter/material.dart';
import '../core/breakpoints/fluid_breakpoints.dart';

class AdaptiveRow extends StatelessWidget {
  final List<Widget> children;
  final double mobileBreakpoint;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;

  const AdaptiveRow({
    super.key,
    required this.children,
    this.mobileBreakpoint = FluidBreakpoints.mobile,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isVertical = constraints.maxWidth < mobileBreakpoint;

        if (isVertical) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildChildrenWithSpacing(isVertical),
          );
        }

        return Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: _buildChildrenWithSpacing(isVertical),
        );
      },
    );
  }

  List<Widget> _buildChildrenWithSpacing(bool isVertical) {
    final List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(isVertical ? children[i] : Expanded(child: children[i]));
      if (i < children.length - 1) {
        spacedChildren.add(
          isVertical ? SizedBox(height: spacing) : SizedBox(width: spacing),
        );
      }
    }
    return spacedChildren;
  }
}
