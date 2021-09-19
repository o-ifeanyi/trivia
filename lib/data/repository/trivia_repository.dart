import 'package:dartz/dartz.dart';
import 'package:trivia/core/constants/constants.dart';
import 'package:trivia/core/errors/exceptions.dart';
import 'package:trivia/core/services/network_service.dart';
import 'package:trivia/data/model/trivia_model.dart';
import 'package:trivia/domain/entity/trivia_entity.dart';
import 'package:trivia/domain/entity/trivia_request_entity.dart';
import 'package:trivia/domain/repository/trivia_repository.dart';

class TriviaRepositoryImpl extends TriviaRepository {
  final NetworkService networkService;

  TriviaRepositoryImpl({required this.networkService});
  @override
  Future<Either<CustomFailure, List<TriviaEntity>>> getTrivias(
      TriviaRequestEntity requestEntity) async {
    try {
      final response = await networkService.get(
        path: BASE_URL,
        query: requestEntity.toMap(),
      );
      final result = response.data['results'] as List;
      final trivias = result.map((e) {
        final model = TriviaModel.formJson(e);
        return model.toEntity();
      }).toList();

      return Right(trivias);
    } on CustomException catch (e) {
      return Left(CustomFailure(message: e.message));
    } catch (e) {
      return Left(CustomFailure(message: DEFAULT_ERROR_MSG));
    }
  }
}
