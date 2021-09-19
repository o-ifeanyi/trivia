import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:trivia/view/screens/home_screen.dart';
import 'package:trivia/view/widgets/wide_button.dart';

import 'robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App test', () {
    testWidgets('Start up and trivia flow', (WidgetTester tester) async {
      final robot = Robot(tester);

      await robot.startApp(HomeScreen());

      expect(find.text('WELCOME TO TH!'), findsOneWidget);
      expect(find.text('Begin trivia'), findsOneWidget);

      await robot.tap(find.byType(WideButton));

      expect(find.text('WELCOME TO TH!'), findsNothing);
      expect(find.text('How many questions would you like to answer?'),
          findsOneWidget);
      expect(find.text('10'), findsOneWidget);

      await robot.dragRight(find.byType(Slider));

      expect(find.text('10'), findsNothing);
      expect(find.text('15'), findsOneWidget);

      await robot.dragLeft(find.byType(Slider));

      expect(find.text('10'), findsNothing);
      expect(find.text('5'), findsOneWidget);

      await robot.tap(find.byType(WideButton));

      expect(find.text('How many questions would you like to answer?'),
          findsNothing);
      expect(find.text('Select a category'), findsOneWidget);

      await robot.tap(find.byType(WideButton));

      expect(find.text('Select a category'), findsNothing);
      expect(find.text('Select a difficulty'), findsOneWidget);

      await robot.tap(find.byType(WideButton));

      expect(find.text('Select a difficulty'), findsNothing);
      expect(find.text('Select the type of trivia'), findsOneWidget);

      await robot.tap(find.byType(WideButton));

      expect(find.byType(WideButton), findsNothing);
      await robot.tap(find.byKey(ValueKey('0')));
      expect(find.byType(WideButton), findsOneWidget);
      await robot.tap(find.byType(WideButton));

      expect(find.byType(WideButton), findsNothing);
      await robot.tap(find.byKey(ValueKey('0')));
      expect(find.byType(WideButton), findsOneWidget);
      await robot.tap(find.byType(WideButton));

      expect(find.byType(WideButton), findsNothing);
      await robot.tap(find.byKey(ValueKey('1')));
      expect(find.byType(WideButton), findsOneWidget);
      await robot.tap(find.byType(WideButton));

      expect(find.byType(WideButton), findsNothing);
      await robot.tap(find.byKey(ValueKey('0')));
      expect(find.byType(WideButton), findsOneWidget);
      await robot.tap(find.byType(WideButton));

      expect(find.byType(WideButton), findsNothing);
      await robot.tap(find.byKey(ValueKey('1')));
      expect(find.byType(WideButton), findsOneWidget);

      await robot.tap(find.byType(WideButton));

      expect(find.text('Home 🏠'), findsOneWidget);
      await Future.delayed(Duration(milliseconds: 1500));

      await robot.tap(find.text('Home 🏠'));

      expect(find.text('WELCOME TO TH!'), findsOneWidget);
      expect(find.text('Begin trivia'), findsOneWidget);

      await Future.delayed(Duration(seconds: 1));
      await robot.destroy();
    });
  });
}
