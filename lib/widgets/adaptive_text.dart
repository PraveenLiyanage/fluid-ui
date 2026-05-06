import 'package:flutter/material.dart';
import '../tokens/typography.dart';

class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const AdaptiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final themeStyle = style ?? Theme.of(context).textTheme.bodyMedium ?? const TextStyle(fontSize: 14);
    final responsiveStyle = FluidTypography.responsiveStyle(context, themeStyle);

    return Text(
      text,
      style: responsiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
