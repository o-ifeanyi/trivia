import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/data/model/trivia_model.dart';

import '../../fixtures/fixtures.dart';

void main() {
  group('Trivia Model', () {
    test('Should return a valid model from Json', () {
      final json = triviaJsonResponseFixture['results'][0];

      final result = TriviaModel.formJson(json);

      expect(result.question, equals(json['question']));
    });

    test('Should return a valid entity from Model', () {
      final json = triviaJsonResponseFixture['results'][0];

      final model = TriviaModel.formJson(json);

      final entity = model.toEntity();

      expect(model.question, equals(entity.question));
    });
  });
}
