import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/core/services/snackbar_service.dart';
import 'package:trivia/domain/repository/trivia_repository.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/screens/exercise_result_screen.dart';

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
    mockTriviaProvider.correctAnswers =
        triviaModelResponseFixture.map((e) => e.toEntity()).toList();
  });

  group('Exercise screen', () {
    testWidgets('Should swipe through the exercise and show result when done',
        (tester) async {
      final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

      await tester.pumpWidget(
        ProviderScope(
            overrides: [triviaProvider.overrideWithValue(mockTriviaProvider)],
            child: MaterialApp(
              home: ExerciseResultScreen(),
            )),
      );

      expect(
          find.text('You got 3 out of 3 questions correctly!'), findsOneWidget);
    });
  });
}
