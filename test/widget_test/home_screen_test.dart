import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/view/screens/home_screen.dart';
import 'package:trivia/view/widgets/wide_button.dart';

void main() {
  group('Home screen', () {
    testWidgets('Should have a welcome text and a button', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      expect(find.text('WELCOME TO TH!'), findsOneWidget);

      expect(find.byType(WideButton), findsOneWidget);
    });
  });
}
