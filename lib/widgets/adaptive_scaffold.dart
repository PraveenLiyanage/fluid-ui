import 'package:flutter/material.dart';
import '../core/breakpoints/fluid_breakpoints.dart';

class AdaptiveScaffold extends StatelessWidget {
  final Widget body;
  final Widget? sidebar;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.sidebar,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = FluidBreakpoints.isMobile(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar != null
          ? (appBar as PreferredSizeWidget)
          : (isMobile && sidebar != null
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: Colors.black),
                )
              : null),
      drawer: isMobile ? sidebar : null,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Row(
        children: [
          if (!isMobile && sidebar != null) sidebar!,
          Expanded(child: body),
        ],
      ),
    );
  }
}
