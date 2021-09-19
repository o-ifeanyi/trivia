import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class NavigationHandler {
  Future<dynamic>? pushNamed(String destinationRoute, {dynamic arg});

  Future<dynamic>? pushReplacementNamed(String destinationRoute, {dynamic arg});

  void pop();

  void popToFirst();

  void exitApp();

  GlobalKey<NavigatorState>? navigatorKey;
}

class NavigationHandlerImpl implements NavigationHandler {
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get state => navigatorKey?.currentState;

  @override
  void exitApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  void pop() {
    return state?.pop();
  }

  @override
  void popToFirst() {
    return state?.popUntil((route) => route.isFirst);
  }

  @override
  Future? pushNamed(String destinationRoute, {arg}) {
    return state?.pushNamed(destinationRoute, arguments: arg);
  }

  @override
  Future? pushReplacementNamed(String destinationRoute, {arg}) {
    return state?.pushReplacementNamed(destinationRoute, arguments: arg);
  }
}
