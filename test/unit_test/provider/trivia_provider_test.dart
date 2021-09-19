import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/core/errors/exceptions.dart';
import 'package:trivia/core/services/snackbar_service.dart';
import 'package:trivia/domain/repository/trivia_repository.dart';
import 'package:trivia/view/provider/trivia_provider.dart';

import '../../fixtures/fixtures.dart';
import '../../mocks/trivia_provider_test.mocks.dart';

@GenerateMocks([TriviaRepository])
void main() {
  late TriviaRepository triviaRepository;
  late TriviaProvider triviaProvider;
  late SnackBarService snackBarService;

  setUp(() {
    snackBarService = SnackBarService();
    triviaRepository = MockTriviaRepository();
    triviaProvider = TriviaProvider(
      triviaRepository: triviaRepository,
      snackBarService: snackBarService,
    );
  });

  group('Trivia Provider', () {
    test('Should return true when getTrivias is successful', () async {
      when(triviaRepository.getTrivias(requestEntityFixture)).thenAnswer((_) {
        return Future.value(Right(triviaModelResponseFixture));
      });

      final response = await triviaProvider.getTrivias();

      expect(response, equals(true));
    });

    test('Should return false when getTrivias is un-successful', () async {
      when(triviaRepository.getTrivias(requestEntityFixture)).thenAnswer((_) {
        return Future.value(
            Left(CustomFailure(message: 'failed to get trivia')));
      });

      final response = await triviaProvider.getTrivias();

      expect(response, equals(false));
    });
  });
}
