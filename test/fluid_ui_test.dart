import 'package:flutter_test/flutter_test.dart';
import 'package:fluid_ui/fluid_ui.dart';

void main() {
  test('FluidBreakpoints mobile value', () {
    expect(FluidBreakpoints.mobile, 600);
  });

  test('FluidSpacing values', () {
    expect(FluidSpacing.md, 16.0);
  });
}
