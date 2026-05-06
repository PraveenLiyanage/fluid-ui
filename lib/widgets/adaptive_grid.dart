import 'package:flutter/material.dart';

class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final double childAspectRatio;

  const AdaptiveGrid({
    super.key,
    required this.children,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
    this.childAspectRatio = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = 1;

        if (constraints.maxWidth > 1600) {
          columns = 5;
        } else if (constraints.maxWidth > 1200) {
          columns = 4;
        } else if (constraints.maxWidth > 900) {
          columns = 3;
        } else if (constraints.maxWidth > 600) {
          columns = 2;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: runSpacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: children.length,
          itemBuilder: (_, i) => children[i],
        );
      },
    );
  }
}
