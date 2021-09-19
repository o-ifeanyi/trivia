import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/core/constants/constants.dart';
import 'package:trivia/core/routes/navigation.dart';
import 'package:trivia/core/routes/router.dart';
import 'package:trivia/injection_container.dart';

class Robot {
  final WidgetTester tester;

  Robot(this.tester);

  Future<void> startApp(Widget widget) async {
    await init();
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          title: 'Trivia',
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Color(0xFF262A31),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: kColorCustom,
              brightness: Brightness.dark,
            ).copyWith(secondary: Color(0xFFD4A048)),
          ),
          navigatorKey: sl<NavigationHandler>().navigatorKey,
          onGenerateRoute: AppRoute.onGenerateRoute,
        ),
      ),
    );
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> tap(Finder finder) async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> dragLeft(Finder finder) async {
    final center = tester.getCenter(find.byType(Slider));
    await tester.drag(find.byType(Slider), Offset(-center.dx, center.dy));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> dragRight(Finder finder) async {
    final center = tester.getCenter(find.byType(Slider));
    await tester.drag(find.byType(Slider), Offset(center.dx, center.dy));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> destroy() async {
    await sl.reset();
  }
}
