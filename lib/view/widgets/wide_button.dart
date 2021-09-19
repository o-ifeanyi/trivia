import 'package:flutter/material.dart';
import 'package:trivia/core/util/config.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    required String text,
    Function()? onpressed,
    bool isTransparent = false,
    bool showBorder = true,
  })  : _onpressed = onpressed,
        _text = text,
        _isTransparent = isTransparent,
        _showBorder = showBorder;

  final Function()? _onpressed;
  final String _text;
  final bool _isTransparent;
  final bool _showBorder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Config.xMargin(context, 5)),
      width: MediaQuery.of(context).size.shortestSide,
      child: InkWell(
        onTap: _onpressed ?? () {},
        child: Container(
          height: Config.yMargin(context, 7.5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: _isTransparent && _showBorder
                  ? Border.all(
                      width: 0.5,
                      color: theme.colorScheme.secondary,
                    )
                  : null,
              color: _isTransparent
                  ? theme.scaffoldBackgroundColor
                  : _onpressed == null
                      ? theme.colorScheme.secondary.withOpacity(0.5)
                      : theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            _text,
            style: Config.b1(context).copyWith(
              color:
                  _isTransparent ? theme.colorScheme.secondary : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
