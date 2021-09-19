import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trivia/core/services/snackbar_service.dart';
import 'package:trivia/view/widgets/custom_snackbar.dart';

class AppAware extends StatefulWidget {
  ///Typically a [MaterialApp] widget or any widget you want desendants to be network aware
  final Widget child;

  AppAware({
    required this.child,
  });
  @override
  _AppAwareState createState() => _AppAwareState();
}

class _AppAwareState extends State<AppAware> {
  OverlaySupportEntry? _snackBarEntry;
  SnackBarService _snackBarService = SnackBarService();

  @override
  void initState() {
    _snackBarService.stream.listen((event) {
      _snackBarEntry?.dismiss();
      _snackBarEntry = showOverlayNotification(
        (context) {
          return CustomSnackBar(event);
        },
        position: event.position,
        duration: event.duration,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _snackBarService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: widget.child,
    );
  }
}
