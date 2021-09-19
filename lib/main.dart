import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/core/util/app_aware.dart';

import 'core/constants/constants.dart';
import 'core/routes/navigation.dart';
import 'core/routes/router.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await init();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppAware(
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
    );
  }
}
