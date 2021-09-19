import 'package:flutter/cupertino.dart';
import 'package:trivia/domain/entity/trivia_entity.dart';
import 'package:trivia/domain/entity/trivia_request_entity.dart';

enum TriviaState {
  Idle,
  Loading,
}

class BaseTrivia extends ChangeNotifier {
  TriviaState _triviaState = TriviaState.Idle;
  TriviaState get triviaState => _triviaState;
  set triviaState(TriviaState newState) {
    _triviaState = newState;
    notifyListeners();
  }

  TriviaRequestEntity _triviaRequestEntity = TriviaRequestEntity();
  TriviaRequestEntity get triviaRequestEntity => _triviaRequestEntity;
  set triviaRequestEntity(TriviaRequestEntity newEntity) {
    _triviaRequestEntity = newEntity;
    notifyListeners();
  }

  List<TriviaEntity> _trivias = [];
  List<TriviaEntity> get trivias => _trivias;
  set trivias(List<TriviaEntity> newTrivias) {
    _trivias = newTrivias;
    notifyListeners();
  }

  List<TriviaEntity> _correctAnswers = [];
  List<TriviaEntity> get correctAnswers => _correctAnswers;
  set correctAnswers(List<TriviaEntity> correctAnswers) {
    _correctAnswers = correctAnswers;
    notifyListeners();
  }

  _updateSelectedAnswers(int index, String answer) {
    _trivias[index] = _trivias[index].copyWith(selectedAnswer: answer);
    notifyListeners();
  }

  updateSelectedAnswers(int index, String answer) =>
      _updateSelectedAnswers(index, answer);

  getCorrectAnswers() async {
    correctAnswers = _trivias
        .where((trivia) => trivia.selectedAnswer == trivia.correctAnswer)
        .toList();
  }

  _reset() {
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      _triviaState = TriviaState.Idle;
      _triviaRequestEntity = TriviaRequestEntity();
      _trivias = [];
      _correctAnswers = [];
    });
  }

  reset() => _reset();
}
