import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';

class PlatformIcons {
  static IconData get arrowBack =>
      Config.isAndroid ? Icons.arrow_back : CupertinoIcons.back;
}
