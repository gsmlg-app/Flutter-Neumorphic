import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  group('NeumorphicStyle', () {
    test('creates with default values', () {
      const style = NeumorphicStyle();
      
      expect(style.depth, isNull);
      expect(style.color, isNull);
      expect(style.shadowLightColor, isNull);
      expect(style.shadowLightColorEmboss, isNull);
      expect(style.shadowDarkColor, isNull);
      expect(style.shadowDarkColorEmboss, isNull);
      expect(style.shape, NeumorphicShape.flat);
      expect(style.boxShape, isNull);
      expect(style.border, isNotNull);
      expect(style.lightSource, LightSource.topLeft);
      expect(style.intensity, isNull);
      expect(style.surfaceIntensity, 0.25);
    });

    test('creates with custom values', () {
      const color = Color(0xFF00FF00);
      const lightColor = Color(0xFFAAFFAA);
      const darkColor = Color(0xFF005500);
      
      const style = NeumorphicStyle(
        depth: 8.0,
        color: color,
        shadowLightColor: lightColor,
        shadowDarkColor: darkColor,
        shape: NeumorphicShape.convex,
        lightSource: LightSource.topRight,
        intensity: 0.8,
        surfaceIntensity: 0.5,
      );
      
      expect(style.depth, 8.0);
      expect(style.color, color);
      expect(style.shadowLightColor, lightColor);
      expect(style.shadowDarkColor, darkColor);
      expect(style.shape, NeumorphicShape.convex);
      expect(style.lightSource, LightSource.topRight);
      expect(style.intensity, 0.8);
      expect(style.surfaceIntensity, 0.5);
    });

    test('copyWith creates new instance with updated values', () {
      const original = NeumorphicStyle(
        depth: 5.0,
        color: Color(0xFF000000),
        shape: NeumorphicShape.flat,
      );
      
      final copied = original.copyWith(
        depth: 10.0,
        shape: NeumorphicShape.concave,
      );
      
      expect(copied.depth, 10.0);
      expect(copied.color, const Color(0xFF000000));
      expect(copied.shape, NeumorphicShape.concave);
    });

    test('equality works correctly', () {
      const style1 = NeumorphicStyle(
        depth: 5.0,
        color: Color(0xFF000000),
        shape: NeumorphicShape.convex,
      );
      
      const style2 = NeumorphicStyle(
        depth: 5.0,
        color: Color(0xFF000000),
        shape: NeumorphicShape.convex,
      );
      
      const style3 = NeumorphicStyle(
        depth: 10.0,
        color: Color(0xFF000000),
        shape: NeumorphicShape.convex,
      );
      
      expect(style1, style2);
      expect(style1, isNot(style3));
      expect(style1.hashCode, style2.hashCode);
      expect(style1.hashCode, isNot(style3.hashCode));
    });
  });

  group('LightSource', () {
    test('LightSource.topLeft has correct values', () {
      expect(LightSource.topLeft.dx, -1.0);
      expect(LightSource.topLeft.dy, -1.0);
    });

    test('LightSource.topRight has correct values', () {
      expect(LightSource.topRight.dx, 1.0);
      expect(LightSource.topRight.dy, -1.0);
    });

    test('LightSource.bottomLeft has correct values', () {
      expect(LightSource.bottomLeft.dx, -1.0);
      expect(LightSource.bottomLeft.dy, 1.0);
    });

    test('LightSource.bottomRight has correct values', () {
      expect(LightSource.bottomRight.dx, 1.0);
      expect(LightSource.bottomRight.dy, 1.0);
    });

    test('LightSource custom constructor', () {
      const custom = LightSource(0.5, -0.5);
      expect(custom.dx, 0.5);
      expect(custom.dy, -0.5);
    });

    test('LightSource invert method works correctly', () {
      const original = LightSource.topLeft;
      const inverted = LightSource.bottomRight;
      
      expect(original.invert(), inverted);
    });

    test('LightSource offset getter returns correct values', () {
      expect(LightSource.topLeft.offset.dx, -1.0);
      expect(LightSource.topLeft.offset.dy, -1.0);
    });

    test('LightSource toOffset scales correctly', () {
      const lightSource = LightSource.topLeft;
      final scaled = lightSource.toOffset(2.0);
      
      expect(scaled.dx, -2.0);
      expect(scaled.dy, -2.0);
    });
  });
}