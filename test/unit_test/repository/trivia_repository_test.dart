import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/core/constants/constants.dart';
import 'package:trivia/core/errors/exceptions.dart';
import 'package:trivia/core/services/network_service.dart';
import 'package:trivia/data/repository/trivia_repository.dart';

import '../../fixtures/fixtures.dart';
import '../../mocks/trivia_repository_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late MockNetworkService networkService;
  late TriviaRepositoryImpl triviaRepositoryImpl;
  setUp(() {
    networkService = MockNetworkService();
    triviaRepositoryImpl = TriviaRepositoryImpl(networkService: networkService);
  });

  group('Trivia Repository', () {
    test(
      'Should return a List of Trivia Models when getTrivia is successful',
      () async {
        when(networkService.get(
          path: anyNamed('path'),
          query: anyNamed('query'),
        )).thenAnswer((_) {
          return Future.value(Response(
            data: triviaJsonResponseFixture,
            requestOptions: RequestOptions(path: ''),
          ));
        });

        final response =
            await triviaRepositoryImpl.getTrivias(requestEntityFixture);

        expect(response.isRight(), equals(true));
      },
    );

    test(
      'Should return a CustomFailure when getTrivia is un-successful',
      () async {
        when(networkService.get(
          path: anyNamed('path'),
          query: anyNamed('query'),
        )).thenAnswer((_) {
          return Future.value(Response(
            requestOptions: RequestOptions(path: ''),
          ));
        });

        final response =
            await triviaRepositoryImpl.getTrivias(requestEntityFixture);

        expect(response, Left(CustomFailure(message: DEFAULT_ERROR_MSG)));
      },
    );
  });
}
