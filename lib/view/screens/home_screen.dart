import 'package:flutter/material.dart';
import 'package:trivia/core/routes/navigation.dart';
import 'package:trivia/core/util/config.dart';
import 'package:trivia/injection_container.dart';
import 'package:trivia/view/screens/pre_exercise_screen.dart';
import 'package:trivia/view/widgets/wide_button.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _opacity = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _opacity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Config.xMargin(context, 5)),
              child: Text(
                'WELCOME TO TH!',
                textAlign: TextAlign.center,
                style: Config.h1(context),
              ),
            ),
            SizedBox(height: Config.yMargin(context, 6)),
            Text(
              '⁉️',
              textAlign: TextAlign.center,
              style: Config.h1(context),
            ),
            Spacer(),
            WideButton(
              text: 'Begin trivia',
              onpressed: () =>
                  sl<NavigationHandler>().pushNamed(PreExerciseScreen.route),
            ),
            SizedBox(height: Config.yMargin(context, 3)),
          ],
        ),
      ),
    );
  }
}
