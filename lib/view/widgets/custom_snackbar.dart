import 'package:flutter/material.dart';
import 'package:trivia/core/services/snackbar_service.dart';
import 'package:trivia/core/util/config.dart';

class CustomSnackBar extends StatelessWidget {
  final SnackbarModel _snackbarModel;

  CustomSnackBar(this._snackbarModel);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.all(
            Config.xMargin(context, 5),
          ),
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _snackbarModel.isError
                ? Theme.of(context).errorColor
                : Theme.of(context).colorScheme.secondary,
          ),
          child: Text(
            _snackbarModel.message ?? '',
            style: Config.b1(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
