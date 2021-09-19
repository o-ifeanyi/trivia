import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({
    Key? key,
    required String text,
    bool isSelected = false,
  })  : _text = text,
        _isSelected = isSelected,
        super(key: key);

  final String _text;
  final bool _isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Config.xMargin(context, 26),
      height: Config.yMargin(context, 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: _isSelected ? 1 : 0.5,
        ),
        color: _isSelected
            ? theme.colorScheme.secondary
            : theme.scaffoldBackgroundColor,
      ),
      child: FittedBox(
        child: Text(
          _text,
          style: Config.b1(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
