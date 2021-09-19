import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/screens/pre_exercise_screen.dart';
import 'package:trivia/view/widgets/wide_button.dart';

void main() {
  setUp(() async {
    await init();
  });

  group('Pre exercise screen', () {
    testWidgets('Should swipe through the exercise options', (tester) async {
      await tester.pumpWidget(
          ProviderScope(child: MaterialApp(home: PreExerciseScreen())));

      expect(find.text('How many questions would you like to answer?'),
          findsOneWidget);

      expect(find.byType(Slider), findsOneWidget);
      expect(find.byType(WideButton), findsOneWidget);

      await tester.tap(find.byType(WideButton));
      await tester.pumpAndSettle();

      expect(find.text('Select a category'), findsOneWidget);
      expect(find.text('How many questions would you like to answer?'),
          findsNothing);
      expect(find.byType(WideButton), findsOneWidget);

      await tester.tap(find.byType(WideButton));
      await tester.pumpAndSettle();

      expect(find.text('Select a category'), findsNothing);
      expect(find.text('Select a difficulty'), findsOneWidget);
      expect(find.byType(WideButton), findsOneWidget);

      await tester.tap(find.byType(WideButton));
      await tester.pumpAndSettle();

      expect(find.text('Select a difficulty'), findsNothing);
      expect(find.text('Select the type of trivia'), findsOneWidget);
      expect(find.text('Get Trivia'), findsOneWidget);
    });
  });
}
