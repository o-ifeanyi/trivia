import 'package:dartz/dartz.dart';
import 'package:trivia/core/errors/exceptions.dart';
import 'package:trivia/domain/entity/trivia_entity.dart';
import 'package:trivia/domain/entity/trivia_request_entity.dart';

abstract class TriviaRepository {
  Future<Either<CustomFailure, List<TriviaEntity>>> getTrivias(
      TriviaRequestEntity requestEntity);
}
