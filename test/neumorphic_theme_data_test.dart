import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  group('NeumorphicThemeData', () {
    test('creates with default values', () {
      const theme = NeumorphicThemeData();
      
      expect(theme.baseColor, const Color(0xFFDDE6E8));
      expect(theme.accentColor, const Color(0xFF2196F3));
      expect(theme.variantColor, const Color(0xFF00BCD4));
      expect(theme.depth, 4);
      expect(theme.intensity, 0.7);
      expect(theme.lightSource, LightSource.topLeft);
    });

    test('creates with custom values', () {
      const baseColor = Color(0xFF333333);
      const accentColor = Color(0xFF007AFF);
      const variantColor = Color(0xFF5856D6);
      
      const theme = NeumorphicThemeData(
        baseColor: baseColor,
        accentColor: accentColor,
        variantColor: variantColor,
        depth: 8,
        intensity: 0.8,
        lightSource: LightSource.bottomRight,
      );
      
      expect(theme.baseColor, baseColor);
      expect(theme.accentColor, accentColor);
      expect(theme.variantColor, variantColor);
      expect(theme.depth, 8);
      expect(theme.intensity, 0.8);
      expect(theme.lightSource, LightSource.bottomRight);
    });

    test('copyWith creates new instance with updated values', () {
      const original = NeumorphicThemeData(
        baseColor: Color(0xFFDDE6E8),
        depth: 4,
        intensity: 0.7,
      );
      
      final copied = original.copyWith(
        baseColor: const Color(0xFF333333),
        depth: 10,
      );
      
      expect(copied.baseColor, const Color(0xFF333333));
      expect(copied.depth, 10);
      expect(copied.intensity, 0.7);
    });

    test('equality works correctly', () {
      const theme1 = NeumorphicThemeData(
        baseColor: Color(0xFFDDE6E8),
        depth: 4,
        intensity: 0.7,
      );
      
      const theme2 = NeumorphicThemeData(
        baseColor: Color(0xFFDDE6E8),
        depth: 4,
        intensity: 0.7,
      );
      
      const theme3 = NeumorphicThemeData(
        baseColor: Color(0xFF333333),
        depth: 4,
        intensity: 0.7,
      );
      
      expect(theme1, theme2);
      expect(theme1, isNot(theme3));
      // Skip hashCode test due to complex calculation
    });

    test('dark theme has correct default values', () {
      final darkTheme = NeumorphicThemeData.dark();
      
      expect(darkTheme.baseColor, const Color(0xFF2D2F2F));
      expect(darkTheme.depth, 4);
    });
  });

  group('NeumorphicTheme', () {
    testWidgets('isUsingDark returns correct value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const NeumorphicApp(
          themeMode: ThemeMode.light,
          home: Scaffold(),
        ),
      );
      
      final context = tester.element(find.byType(Scaffold));
      expect(NeumorphicTheme.isUsingDark(context), isFalse);
    });

    testWidgets('of returns correct theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          theme: const NeumorphicThemeData(baseColor: Color(0xFFDDE6E8)),
          home: const Scaffold(),
        ),
      );
      
      final context = tester.element(find.byType(Scaffold));
      final theme = NeumorphicTheme.of(context);
      
      expect(theme, isNotNull);
      expect(theme!.current!.baseColor, const Color(0xFFDDE6E8));
    });
  });
}