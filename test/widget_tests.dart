import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

void main() {
  group('NeumorphicSwitch', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      bool value = false;
      
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return NeumorphicSwitch(
                    value: value,
                    onChanged: (newValue) {
                      setState(() => value = newValue);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicSwitch), findsOneWidget);
    });

    testWidgets('toggles value when tapped', (WidgetTester tester) async {
      bool value = false;
      
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return NeumorphicSwitch(
                    value: value,
                    onChanged: (newValue) {
                      setState(() => value = newValue);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
      
      expect(value, isFalse);
      await tester.tap(find.byType(NeumorphicSwitch));
      await tester.pumpAndSettle();
      expect(value, isTrue);
    });
  });

  group('NeumorphicSlider', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      double value = 0.5;
      
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return NeumorphicSlider(
                    value: value,
                    onChanged: (newValue) {
                      setState(() => value = newValue);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicSlider), findsOneWidget);
    });

    testWidgets('has correct initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicSlider(
                value: 0.75,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );
      
      final slider = tester.widget<NeumorphicSlider>(find.byType(NeumorphicSlider));
      expect(slider.value, 0.75);
    });
  });

  group('NeumorphicCheckbox', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      bool value = false;
      
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return NeumorphicCheckbox(
                    value: value,
                    onChanged: (newValue) {
                      setState(() => value = newValue);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicCheckbox), findsOneWidget);
    });

    testWidgets('toggles when tapped', (WidgetTester tester) async {
      bool value = false;
      
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return NeumorphicCheckbox(
                    value: value,
                    onChanged: (newValue) {
                      setState(() => value = newValue);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
      
      expect(value, isFalse);
      await tester.tap(find.byType(NeumorphicCheckbox));
      await tester.pumpAndSettle();
      expect(value, isTrue);
    });
  });

  group('NeumorphicText', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicText(
                'Hello World',
                textStyle: NeumorphicTextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      );
      
      expect(find.text('Hello World'), findsOneWidget);
      expect(find.byType(NeumorphicText), findsOneWidget);
    });

    testWidgets('applies custom style', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicText(
                'Styled Text',
                textStyle: NeumorphicTextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      );
      
      await tester.pumpAndSettle();
      expect(find.byType(NeumorphicText), findsOneWidget);
    });
  });

  group('NeumorphicIcon', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicIcon(
                Icons.favorite,
                size: 32,
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicIcon), findsOneWidget);
    });

    testWidgets('applies custom size', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicIcon(
                Icons.star,
                size: 48,
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicIcon), findsOneWidget);
    });
  });

  group('NeumorphicRadio', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      int? selectedValue;
      
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return NeumorphicRadio<int>(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() => selectedValue = value);
                    },
                    child: const Text('Option 1'),
                  );
                },
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicRadio<int>), findsOneWidget);
      expect(find.text('Option 1'), findsOneWidget);
    });
  });

  group('NeumorphicProgress', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicProgress(
                percent: 0.75,
              ),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicProgress), findsOneWidget);
    });

    testWidgets('has correct initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            body: Center(
              child: NeumorphicProgress(
                percent: 0.3,
              ),
            ),
          ),
        ),
      );
      
      final progress = tester.widget<NeumorphicProgress>(find.byType(NeumorphicProgress));
      expect(progress.percent, 0.3);
    });
  });

  group('NeumorphicAppBar', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            appBar: NeumorphicAppBar(
              title: Text('Test App Bar'),
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicAppBar), findsOneWidget);
      expect(find.text('Test App Bar'), findsOneWidget);
    });

    testWidgets('renders with actions', (WidgetTester tester) async {
      await tester.pumpWidget(
        NeumorphicApp(
          home: Scaffold(
            appBar: NeumorphicAppBar(
              title: Text('Test App Bar'),
              actions: [
                Icon(Icons.search),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ),
      );
      
      expect(find.byType(NeumorphicAppBar), findsOneWidget);
      expect(find.text('Test App Bar'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });
  });
}