import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required int selectedIndex,
    required int numberOfQuestions,
  })  : _selectedIndex = selectedIndex,
        _numberOfQuestions = numberOfQuestions,
        super(key: key);

  final int _selectedIndex;
  final int _numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: Config.xMargin(context, 5)),
      child: Row(
        children: List.generate(_numberOfQuestions, (index) {
          return Expanded(
            child: Container(
              height: 5,
              margin: EdgeInsets.only(right: Config.xMargin(context, 4)),
              decoration: BoxDecoration(
                color: index > _selectedIndex
                    ? theme.colorScheme.secondary.withOpacity(0.1)
                    : theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }),
      ),
    );
  }
}
