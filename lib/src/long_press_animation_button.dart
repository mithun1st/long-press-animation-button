import 'dart:async';
import 'package:flutter/material.dart';

class LongPressAnimationButton extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;

  final void Function() onLongPress;
  final void Function()? onTap;

  final Color backgroundColor;
  final Color loadingColor;

  final int durationAsSecond;
  final double height;
  final double width;
  final double? borderRadius;
  final BoxBorder? border;

  const LongPressAnimationButton({
    required this.text,
    this.textStyle,

    required this.onLongPress,
    this.onTap,

    this.backgroundColor = Colors.blue,
    this.loadingColor = Colors.green,

    this.durationAsSecond = 1,
    this.height = 40,
    this.width = 140,
    this.borderRadius,
    this.border,

    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _LongPressAnimationButtonState();
  }
}

class _LongPressAnimationButtonState extends State<LongPressAnimationButton> {
  double _fractionalSize = 0;
  bool _isPressActive = false;

  double _backgroundColorOpacity = 1;
  double get _loadingColorOpacity => ((_fractionalSize / 1) * .5) + .5;

  void _clickEffect() {
    setState(() => _backgroundColorOpacity = .5);
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => _backgroundColorOpacity = 1);
    });
  }

  void _onTap() {
    _clickEffect();
    widget.onTap?.call();
  }

  Future<void> _onPress() async {
    _isPressActive = true;

    while (_isPressActive && _fractionalSize < 1) {
      setState(() {
        _fractionalSize += .2;
        if (_fractionalSize > 1.0) {
          _fractionalSize = 1;
        }
      });
      await Future.delayed(
        Duration(milliseconds: widget.durationAsSecond * 200),
      );
    }

    if (_isPressActive) {
      widget.onLongPress();
    }
  }

  void _onPressRelease() {
    setState(() {
      _fractionalSize = 0;
      _isPressActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null ? _onTap : null,

      onLongPressDown: (_) => _onPress(),

      onLongPressEnd: (_) => _onPressRelease(),
      onLongPressCancel: () => _onPressRelease(),

      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                border: widget.border ?? Border.all(),
                borderRadius: BorderRadius.circular(
                  (widget.borderRadius ?? 0) + 2,
                ),
                color: widget.backgroundColor.withValues(
                  alpha: _backgroundColorOpacity,
                ),
              ),
              child: AnimatedFractionallySizedBox(
                duration: Duration(milliseconds: widget.durationAsSecond * 200),
                widthFactor: _fractionalSize,
                heightFactor: 1,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      widget.borderRadius ?? 0,
                    ),
                    color: widget.loadingColor.withValues(
                      alpha: _loadingColorOpacity,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style:
                    widget.textStyle ?? TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
