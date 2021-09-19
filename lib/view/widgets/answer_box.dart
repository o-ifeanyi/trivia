import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    Key? key,
    required bool isSelected,
    required String text,
  })  : _isSelected = isSelected,
        _text = text,
        super(key: key);

  final bool _isSelected;
  final String _text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Config.xMargin(context, 5),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: _isSelected ? 1 : 0.5,
        ),
        color: _isSelected
            ? theme.colorScheme.secondary
            : theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Config.xMargin(context, 4)),
        child: Text(_text, style: Config.b1(context)),
      ),
    );
  }
}
