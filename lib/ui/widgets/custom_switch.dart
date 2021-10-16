import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  bool isOn = false;
  double leftPadding = 3;
  double rightPadding = 3;
  Color color = const Color(0xFF333333);
  AnimationController? _controller;
  Animation<Color?>? _colorTween;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _colorTween =
        ColorTween(begin: const Color(0xFF333333), end: AppColors.orange)
            .animate(_controller!);
    _controller!.addListener(() {
      setState(() {});
    });
    // _controller.forward()..whenComplete(() => );
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isOn) {
          _controller!.reverse();

          isOn = false;
        } else {
          _controller!.forward();
          isOn = true;
        }
      },
      child: Container(
        height: 12,
        width: 22,
        decoration: BoxDecoration(
          color: _colorTween!.value!.withOpacity(0.15),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.only(left: 3, top: 2, bottom: 2),
        child: Stack(
          children: [
            Positioned(
              left: _controller!.value * 8,
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: _colorTween!.value,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
