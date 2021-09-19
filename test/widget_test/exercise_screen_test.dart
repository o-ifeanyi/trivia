import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/core/services/snackbar_service.dart';
import 'package:trivia/domain/repository/trivia_repository.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/screens/exercise_screen.dart';
import 'package:trivia/view/widgets/wide_button.dart';

import '../fixtures/fixtures.dart';
import '../mocks/trivia_provider_test.mocks.dart';

void main() {
  late TriviaRepository triviaRepository;
  late TriviaProvider mockTriviaProvider;
  late SnackBarService snackBarService;

  setUp(() async {
    await init();
    snackBarService = SnackBarService();
    triviaRepository = MockTriviaRepository();
    mockTriviaProvider = TriviaProvider(
      triviaRepository: triviaRepository,
      snackBarService: snackBarService,
    );

    mockTriviaProvider.trivias =
        triviaModelResponseFixture.map((e) => e.toEntity()).toList();
  });

  group('Exercise screen', () {
    testWidgets(
        'Should swipe through the exercise, Next or Done button should only be visible when an option has been selected',
        (tester) async {
      final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

      await tester.pumpWidget(
        ProviderScope(
            overrides: [triviaProvider.overrideWithValue(mockTriviaProvider)],
            child: MaterialApp(
              home: ExerciseScreen(),
            )),
      );

      expect(find.text('Cashmere is the wool from which kind of animal?'),
          findsOneWidget);
      expect(find.text('Next'), findsNothing);

      await tester.tap(find.byKey(ValueKey('2')));
      await tester.pumpAndSettle();

      expect(find.text('Next'), findsOneWidget);

      await tester.tap(find.byType(WideButton));
      await tester.pumpAndSettle();

      expect(find.text('Cashmere is the wool from which kind of animal?'),
          findsNothing);
      expect(find.text('What are rhino\'s horn made of?'), findsOneWidget);
      expect(find.text('Next'), findsNothing);

      await tester.tap(find.byKey(ValueKey('1')));
      await tester.pumpAndSettle();

      expect(find.text('Next'), findsOneWidget);

      await tester.tap(find.byType(WideButton));
      await tester.pumpAndSettle();

      expect(find.text('What are rhino\'s horn made of?'), findsNothing);
      expect(
          find.text('The now extinct species "Thylacine" was native to where?'),
          findsOneWidget);
      expect(find.text('Done'), findsNothing);

      await tester.tap(find.byKey(ValueKey('2')));
      await tester.pumpAndSettle();

      expect(find.text('Done'), findsOneWidget);
    });
  });
}
