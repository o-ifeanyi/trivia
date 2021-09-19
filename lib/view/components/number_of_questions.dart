import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/widgets/wide_button.dart';

final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

class NumberOfQuestions extends ConsumerWidget {
  const NumberOfQuestions({Key? key, required PageController pageController})
      : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final trivia = watch(triviaProvider);
    return Column(
      children: [
        SizedBox(height: Config.yMargin(context, 3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Config.xMargin(context, 5)),
          child: Text(
            'How many questions would you like to answer?',
            textAlign: TextAlign.center,
            style: Config.h2(context),
          ),
        ),
        Spacer(),
        Text(
          trivia.triviaRequestEntity.numberOfQuestions.toStringAsFixed(0),
          style: Config.h1(context),
        ),
        SizedBox(height: Config.yMargin(context, 3)),
        Slider(
          value: trivia.triviaRequestEntity.numberOfQuestions,
          onChanged: (newVal) {
            context.read(triviaProvider).triviaRequestEntity =
                trivia.triviaRequestEntity.copyWith(numberOfQuestions: newVal);
          },
          min: 5,
          max: 15,
        ),
        Spacer(),
        WideButton(
          text: 'Continue',
          onpressed: () => _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
        ),
        SizedBox(height: Config.yMargin(context, 3)),
      ],
    );
  }
}
