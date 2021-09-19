import 'dart:async';

import 'package:overlay_support/overlay_support.dart';

class SnackbarModel {
  final String? message;
  final bool isError;
  final NotificationPosition position;
  final Duration duration;

  SnackbarModel({
    this.message,
    this.isError = false,
    this.position = NotificationPosition.top,
    this.duration = const Duration(seconds: 4),
  });
}

class SnackBarService {
  static final SnackBarService _snackBarService = SnackBarService._internal();
  factory SnackBarService() {
    return _snackBarService;
  }
  SnackBarService._internal();

  StreamController<SnackbarModel> _controller =
      StreamController<SnackbarModel>();

  Stream<SnackbarModel> get stream => _controller.stream;
  StreamController<SnackbarModel> get controller => _controller;

  void dispose() => _controller.close();
}
