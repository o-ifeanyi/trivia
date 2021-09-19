import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/view/screens/exercise_result_screen.dart';
import 'package:trivia/view/screens/exercise_screen.dart';
import 'package:trivia/view/screens/home_screen.dart';
import 'package:trivia/view/screens/pre_exercise_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return pushPage(HomeScreen());
      case '/pre_exercise_screen':
        return pushPage(PreExerciseScreen());
      case '/exercise_screen':
        final args = settings.arguments;
        return pushPage(ExerciseScreen(showAnswers: args != null));
      case '/exercise_result_screen':
        return pushPage(ExerciseResultScreen());
      default:
        return pushPage(PreExerciseScreen());
    }
  }

  static Route<dynamic> pushPage(Widget screen) {
    if (Config.isAndroid) {
      return MaterialPageRoute(builder: (context) => screen);
    }
    return CupertinoPageRoute(builder: (context) => screen);
  }

  static String get initialRoute {
    return HomeScreen.route;
  }
}
