// Mocks generated by Mockito 5.0.7 from annotations
// in trivia/test/unit_test/provider/trivia_provider_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:trivia/core/errors/exceptions.dart' as _i5;
import 'package:trivia/domain/entity/trivia_entity.dart' as _i6;
import 'package:trivia/domain/entity/trivia_request_entity.dart' as _i7;
import 'package:trivia/domain/repository/trivia_repository.dart' as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [TriviaRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTriviaRepository extends _i1.Mock implements _i3.TriviaRepository {
  MockTriviaRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.CustomFailure, List<_i6.TriviaEntity>>> getTrivias(
          _i7.TriviaRequestEntity? requestEntity) =>
      (super.noSuchMethod(Invocation.method(#getTrivias, [requestEntity]),
          returnValue: Future<
                  _i2.Either<_i5.CustomFailure, List<_i6.TriviaEntity>>>.value(
              _FakeEither<_i5.CustomFailure, List<_i6.TriviaEntity>>())) as _i4
          .Future<_i2.Either<_i5.CustomFailure, List<_i6.TriviaEntity>>>);
}
