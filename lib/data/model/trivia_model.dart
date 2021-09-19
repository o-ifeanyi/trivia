import 'package:trivia/core/constants/constants.dart';
import 'package:trivia/domain/entity/trivia_entity.dart';

class TriviaModel extends TriviaEntity {
  TriviaModel({
    String? category,
    String? difficulty,
    String? type,
    String? question,
    String? correctAnswer,
    String? selectedAnswer,
    List<String>? incorrectAnswers,
    List<String>? options,
  }) : super(
          category: category,
          difficulty: difficulty,
          type: type,
          question: question,
          correctAnswer: correctAnswer,
          selectedAnswer: '',
          incorrectAnswers: incorrectAnswers,
          options: options,
        );

  factory TriviaModel.formJson(Json json) {
    return TriviaModel(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      selectedAnswer: '',
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
      options: List<String>.from(json['incorrect_answers'])
        ..add(json['correct_answer'])
        ..shuffle(),
    );
  }

  TriviaEntity toEntity() {
    return TriviaEntity(
      category: this.category,
      type: this.type,
      difficulty: this.difficulty,
      question: this.question,
      correctAnswer: this.correctAnswer,
      selectedAnswer: this.selectedAnswer,
      incorrectAnswers: this.incorrectAnswers,
      options: this.options,
    );
  }
}
