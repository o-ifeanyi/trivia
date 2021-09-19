import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/core/routes/navigation.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/provider/trivia_provider.dart';
import 'package:trivia/view/screens/exercise_result_screen.dart';
import 'package:trivia/view/widgets/answer_box.dart';
import 'package:trivia/view/widgets/progress_bar.dart';
import 'package:trivia/view/widgets/wide_button.dart';

final triviaProvider = sl<ChangeNotifierProvider<TriviaProvider>>();

class ExerciseScreen extends StatefulWidget {
  static const String route = '/exercise_screen';

  final bool showAnswers;

  ExerciseScreen({this.showAnswers = false});
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final trivia = watch(triviaProvider);
      return WillPopScope(
        onWillPop: () async {
          final response = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    'Your progress would be lost',
                    style: Config.b1(context),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        'Cancel',
                        style: Config.b1(context),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                        trivia.reset();
                      },
                      child: Text(
                        'Continue',
                        style: Config.b1(context),
                      ),
                    )
                  ],
                );
              });

          return response ?? false;
        },
        child: Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Config.yMargin(context, 3)),
                ProgressBar(
                    selectedIndex: _currentIndex,
                    numberOfQuestions: trivia.trivias.length),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: trivia.trivias.length,
                    onPageChanged: (val) {
                      setState(() {
                        _currentIndex = val;
                      });
                    },
                    itemBuilder: (context, questionIndex) {
                      final triviaEntity = trivia.trivias[questionIndex];
                      final options = triviaEntity.options!;

                      if (widget.showAnswers) {
                        Future.delayed(Duration.zero).then((value) {
                          trivia.updateSelectedAnswers(
                              questionIndex, triviaEntity.correctAnswer!);
                        });
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: Config.yMargin(context, 3)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Config.xMargin(context, 5)),
                            child: Text(
                              triviaEntity.question ?? 'Empty',
                              style: Config.h3(context).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: Config.yMargin(context, 3)),
                          Expanded(
                            child: ListView.separated(
                              itemCount: options.length,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Config.xMargin(context, 5)),
                              separatorBuilder: (context, _) =>
                                  SizedBox(height: Config.yMargin(context, 2)),
                              itemBuilder: (context, answerIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    if (widget.showAnswers) return;
                                    final answer = options[answerIndex];
                                    trivia.updateSelectedAnswers(
                                        questionIndex, answer);
                                    _animationController.forward();
                                  },
                                  child: AnswerBox(
                                    key: ValueKey('$answerIndex'),
                                    isSelected: options[answerIndex] ==
                                        triviaEntity.selectedAnswer,
                                    text: options[answerIndex],
                                  ),
                                );
                              },
                            ),
                          ),
                          if (widget.showAnswers)
                            WideButton(
                              text: _currentIndex + 1 == trivia.trivias.length
                                  ? 'Done'
                                  : 'Next',
                              onpressed: () {
                                if (_currentIndex + 1 ==
                                    trivia.trivias.length) {
                                  sl<NavigationHandler>().pop();
                                  trivia.reset();
                                } else {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOutSine,
                                  );
                                  _animationController.reverse();
                                }
                              },
                            ),
                          if (!widget.showAnswers &&
                              triviaEntity.selectedAnswer!.isNotEmpty)
                            FadeTransition(
                              opacity: _animation,
                              child: WideButton(
                                text: _currentIndex + 1 == trivia.trivias.length
                                    ? 'Done'
                                    : 'Next',
                                onpressed: () {
                                  if (_currentIndex + 1 ==
                                      trivia.trivias.length) {
                                    trivia.getCorrectAnswers();
                                    sl<NavigationHandler>()
                                        .pushReplacementNamed(
                                            ExerciseResultScreen.route);
                                  } else {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOutSine,
                                    );
                                    _animationController.reverse();
                                  }
                                },
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: Config.yMargin(context, 3)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
