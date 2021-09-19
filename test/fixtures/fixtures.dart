import 'package:trivia/data/model/trivia_model.dart';
import 'package:trivia/core/constants/constants.dart';
import 'package:trivia/domain/entity/trivia_request_entity.dart';

TriviaRequestEntity get requestEntityFixture => TriviaRequestEntity();

Json get triviaJsonResponseFixture => {
      "response_code": 0,
      "results": [
        {
          "category": "Animals",
          "type": "multiple",
          "difficulty": "medium",
          "question": "Cashmere is the wool from which kind of animal?",
          "correct_answer": "Goat",
          "incorrect_answers": ["Sheep", "Camel", "Llama"]
        },
        {
          "category": "Animals",
          "type": "multiple",
          "difficulty": "medium",
          "question": "What are rhino&#039;s horn made of?",
          "correct_answer": "Keratin",
          "incorrect_answers": ["Bone", "Ivory", "Skin"]
        },
        {
          "category": "Animals",
          "type": "multiple",
          "difficulty": "medium",
          "question":
              "The now extinct species &quot;Thylacine&quot; was native to where?",
          "correct_answer": "Tasmania, Australia",
          "incorrect_answers": [
            "Baluchistan, Pakistan",
            "Wallachia, Romania",
            "Oregon, United States"
          ]
        },
      ]
    };

List<TriviaModel> get triviaModelResponseFixture => [
      TriviaModel(
        category: 'Animals',
        type: 'multiple',
        difficulty: 'medium',
        question: 'Cashmere is the wool from which kind of animal?',
        correctAnswer: 'Goat',
        incorrectAnswers: ["Sheep", "Camel", "Llama"],
        options: ["Sheep", "Camel", "Goat", "Llama"],
        selectedAnswer: '',
      ),
      TriviaModel(
        category: 'Animals',
        type: 'multiple',
        difficulty: 'medium',
        question: 'What are rhino\'s horn made of?',
        correctAnswer: 'Keratin',
        incorrectAnswers: ["Bone", "Ivory", "Skin"],
        options: ["Bone", "Keratin", "Ivory", "Skin"],
        selectedAnswer: '',
      ),
      TriviaModel(
        category: 'Animals',
        type: 'multiple',
        difficulty: 'medium',
        question: 'The now extinct species "Thylacine" was native to where?',
        correctAnswer: 'Tasmania, Australia',
        incorrectAnswers: [
          "Baluchistan, Pakistan",
          "Wallachia, Romania",
          "Oregon, United States"
        ],
        options: [
          "Tasmania, Australia",
          "Baluchistan, Pakistan",
          "Wallachia, Romania",
          "Oregon, United States"
        ],
        selectedAnswer: '',
      ),
    ];
