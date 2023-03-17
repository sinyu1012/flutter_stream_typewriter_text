import 'dart:async';

import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final TextEditingController controller;
  final TextStyle? style;
  final bool textIsFinished;

  const TypewriterText({
    Key? key,
    required this.controller,
    this.style,
    this.textIsFinished = false,
  }) : super(key: key);

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late final Timer _cursorTimer;
  late final Timer _timer;

  String _displayedText = '';
  bool _cursorVisible = true;
  int textLength = 0;

  @override
  void initState() {
    super.initState();
    textLength = widget.controller.text.length;
    // _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
    //   if (_displayedText.length < textLength) {
    //     _displayedText =
    //         widget.controller.text.substring(0, _displayedText.length + 1);
    //   } else {
    //     timer.cancel();
    //   }
    // });
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _cursorVisible = !_cursorVisible;
      });
    });
  }

  @override
  void didUpdateWidget(TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      widget.controller.addListener(_onControllerChange);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _cursorTimer.cancel();
    widget.controller.removeListener(_onControllerChange);
    super.dispose();
  }

  void _onControllerChange() {
    setState(() {
      textLength = widget.controller.text.length;
      _displayedText = widget.controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText + (_cursorVisible && !widget.textIsFinished ? '|' : ''),
      style: widget.style,
    );
  }
}
