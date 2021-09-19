import 'package:equatable/equatable.dart';

class TriviaEntity extends Equatable {
  final String? category;
  final String? type;
  final String? difficulty;
  final String? question;
  final String? correctAnswer;
  final String? selectedAnswer;
  final List<String>? incorrectAnswers;
  final List<String>? options;

  TriviaEntity({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.selectedAnswer,
    this.incorrectAnswers,
    this.options,
  });

  TriviaEntity copyWith({
    String? selectedAnswer,
  }) {
    return TriviaEntity(
      category: this.category,
      type: this.type,
      difficulty: this.difficulty,
      question: this.question,
      correctAnswer: this.correctAnswer,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      incorrectAnswers: this.incorrectAnswers,
      options: this.options,
    );
  }

  @override
  List<Object?> get props => [question];
}
