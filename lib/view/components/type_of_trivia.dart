import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/core/platform_specific/platform_progress_indicator.dart';
import 'package:trivia/core/routes/navigation.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/base_trivia.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/screens/exercise_screen.dart';
import 'package:trivia/view/widgets/option_box.dart';
import 'package:trivia/view/widgets/wide_button.dart';

final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

class TypeOfTrivia extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final trivia = watch(triviaProvider);
    return Column(
      children: [
        SizedBox(height: Config.yMargin(context, 3)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Config.xMargin(context, 5)),
          child: Text(
            'Select the type of trivia',
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
              maxCrossAxisExtent: Config.xMargin(context, 48),
              childAspectRatio: 3 / 1,
              mainAxisSpacing: Config.xMargin(context, 3),
              crossAxisSpacing: Config.xMargin(context, 3),
            ),
            children: ['True/False', 'Multiple choice']
                .map((e) => GestureDetector(
                      onTap: () {
                        trivia.triviaRequestEntity =
                            trivia.triviaRequestEntity.copyWith(type: e);
                      },
                      child: OptionBox(
                        text: e,
                        isSelected: trivia.triviaRequestEntity.type == e,
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: Config.yMargin(context, 2)),
        trivia.triviaState == TriviaState.Loading
            ? PlatformProgressIndicator()
            : WideButton(
                text: 'Get Trivia',
                onpressed: () async {
                  context.read(triviaProvider).getTrivias().then((success) {
                    if (success) {
                      sl<NavigationHandler>()
                          .pushReplacementNamed(ExerciseScreen.route);
                    }
                  });
                },
              ),
        SizedBox(height: Config.yMargin(context, 3)),
      ],
    );
  }
}
