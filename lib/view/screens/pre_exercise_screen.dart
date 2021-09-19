import 'package:flutter/material.dart';
import 'package:trivia/core/platform_specific/platform_icons.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/view/components/choose_difficulty.dart';
import 'package:trivia/view/components/number_of_questions.dart';
import 'package:trivia/view/components/select_category.dart';
import 'package:trivia/view/components/type_of_trivia.dart';

class PreExerciseScreen extends StatefulWidget {
  static const String route = '/pre_exercise_screen';
  @override
  _PreExerciseScreenState createState() => _PreExerciseScreenState();
}

class _PreExerciseScreenState extends State<PreExerciseScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      NumberOfQuestions(pageController: _pageController),
      SelectCategory(pageController: _pageController),
      ChooseDifficulty(pageController: _pageController),
      TypeOfTrivia(),
    ];

    return WillPopScope(
      onWillPop: () {
        if (_pageController.hasClients) {
          _pageController.previousPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutSine,
          );
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: _selectedIndex == 0
              ? SizedBox.shrink()
              : IconButton(
                  icon: Icon(PlatformIcons.arrowBack),
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOutSine,
                      );
                    }
                  },
                ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Config.yMargin(context, 3)),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (val) {
                    setState(() {
                      _selectedIndex = val;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _pages[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
