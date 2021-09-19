import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';

class PlatformProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config.yMargin(context, 7.5),
      child: Center(
        child: Config.isAndroid
            ? CircularProgressIndicator()
            : CupertinoActivityIndicator(),
      ),
    );
  }
}
