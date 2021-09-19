import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/core/routes/navigation.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/screens/exercise_screen.dart';
import 'package:trivia/view/widgets/wide_button.dart';

final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

class ExerciseResultScreen extends StatelessWidget {
  static const String route = '/exercise_result_screen';
  const ExerciseResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Consumer(
        builder: (context, watch, child) {
          final trivia = watch(triviaProvider);
          return Column(
            children: [
              SizedBox(height: Config.yMargin(context, 9)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Config.xMargin(context, 5)),
                child: Text(
                  'You got ${trivia.correctAnswers.length} out of ${trivia.trivias.length} questions correctly!',
                  textAlign: TextAlign.center,
                  style: Config.h1(context),
                ),
              ),
              Spacer(),
              WideButton(
                text: 'See Correct Answers',
                onpressed: () {
                  sl<NavigationHandler>()
                      .pushReplacementNamed(ExerciseScreen.route, arg: true);
                },
              ),
              SizedBox(height: Config.yMargin(context, 2)),
              WideButton(
                text: 'Home 🏠',
                isTransparent: true,
                onpressed: () {
                  sl<NavigationHandler>().popToFirst();
                  trivia.reset();
                },
              ),
              SizedBox(height: Config.yMargin(context, 3)),
            ],
          );
        },
      ),
    );
  }
}
