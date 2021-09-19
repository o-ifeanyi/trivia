import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/widgets/option_box.dart';
import 'package:trivia/view/widgets/wide_button.dart';

final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

class ChooseDifficulty extends ConsumerWidget {
  const ChooseDifficulty({Key? key, required PageController pageController})
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
            'Select a difficulty',
            textAlign: TextAlign.center,
            style: Config.h2(context),
          ),
        ),
        SizedBox(height: Config.yMargin(context, 3)),
        Expanded(
          child: GridView(
            padding:
                EdgeInsets.symmetric(horizontal: Config.xMargin(context, 5)),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: Config.xMargin(context, 30),
              childAspectRatio: 3 / 1.5,
              mainAxisSpacing: Config.xMargin(context, 3),
              crossAxisSpacing: Config.xMargin(context, 3),
            ),
            children: ['Easy', 'Medium', 'Hard']
                .map((e) => GestureDetector(
                      onTap: () {
                        trivia.triviaRequestEntity =
                            trivia.triviaRequestEntity.copyWith(difficulty: e);
                      },
                      child: OptionBox(
                        text: e,
                        isSelected: trivia.triviaRequestEntity.difficulty == e,
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: Config.yMargin(context, 2)),
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
