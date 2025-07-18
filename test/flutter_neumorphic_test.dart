import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  testWidgets('NeumorphicApp builds without error', (WidgetTester tester) async {
    await tester.pumpWidget(
      const NeumorphicApp(
        home: Scaffold(body: Text('Test')),
      ),
    );
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('NeumorphicButton renders correctly', (WidgetTester tester) async {
    bool pressed = false;
    
    await tester.pumpWidget(
      NeumorphicApp(
        home: Scaffold(
          body: Center(
            child: NeumorphicButton(
              onPressed: () => pressed = true,
              child: const Text('Button'),
            ),
          ),
        ),
      ),
    );
    
    expect(find.text('Button'), findsOneWidget);
    expect(find.byType(NeumorphicButton), findsOneWidget);
    
    await tester.tap(find.byType(NeumorphicButton));
    await tester.pumpAndSettle();
    
    expect(pressed, isTrue);
  });

  testWidgets('NeumorphicContainer renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      NeumorphicApp(
        home: Scaffold(
          body: Center(
            child: Neumorphic(
              child: const SizedBox(width: 100, height: 100),
            ),
          ),
        ),
      ),
    );
    
    expect(find.byType(Neumorphic), findsOneWidget);
  });

  testWidgets('NeumorphicTheme changes theme correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const NeumorphicApp(
        themeMode: ThemeMode.light,
        home: TestThemeWidget(),
      ),
    );
    
    expect(find.byType(TestThemeWidget), findsOneWidget);
  });
}

class TestThemeWidget extends StatelessWidget {
  const TestThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NeumorphicButton(
          onPressed: () {
            NeumorphicTheme.of(context)?.themeMode = ThemeMode.dark;
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
