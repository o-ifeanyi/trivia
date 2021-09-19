import 'package:trivia/core/services/snackbar_service.dart';
import 'package:trivia/domain/repository/trivia_repository.dart';
import 'package:trivia/view/provider/base_trivia.dart';

class TriviaProvider extends BaseTrivia {
  final TriviaRepository triviaRepository;
  final SnackBarService snackBarService;

  TriviaProvider(
      {required this.triviaRepository, required this.snackBarService});

  Future<bool> getTrivias() async {
    triviaState = TriviaState.Loading;
    final triviaEither = await triviaRepository.getTrivias(triviaRequestEntity);
    triviaState = TriviaState.Idle;
    return triviaEither.fold(
      (failure) {
        snackBarService.controller.add(SnackbarModel(
          message: failure.message,
          isError: true,
        ));
        return false;
      },
      (response) {
        trivias = response;
        return true;
      },
    );
  }
}
