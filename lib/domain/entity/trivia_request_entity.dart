import 'package:equatable/equatable.dart';
import 'package:trivia/core/constants/constants.dart';

class TriviaRequestEntity extends Equatable {
  final double numberOfQuestions;
  final int category;
  final String difficulty;
  final String type;

  TriviaRequestEntity({
    this.numberOfQuestions = 10,
    this.category = 9,
    this.difficulty = 'Easy',
    this.type = 'True/False',
  });

  TriviaRequestEntity copyWith({
    double? numberOfQuestions,
    int? category,
    String? difficulty,
    String? type,
  }) {
    return TriviaRequestEntity(
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      type: type ?? this.type,
    );
  }

  Json toMap() {
    return {
      'amount': this.numberOfQuestions.toInt(),
      'category': this.category,
      'difficulty': this.difficulty.toLowerCase(),
      if (this.type == 'True/False') 'type': 'boolean',
      if (this.type == 'Multiple choice') 'type': 'multiple',
    };
  }

  @override
  List<Object?> get props => [];
}
