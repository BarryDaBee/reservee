import 'dart:async';
import 'package:flutter/material.dart';

import 'package:reservee_app/core/exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  AnimationController? _controller;
  AnimationController? _fadeInController;
  CurvedAnimation? _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeInController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeInController!.addListener(() {
      setState(() {});
    });
    _animation =
        CurvedAnimation(parent: _controller!, curve: Curves.decelerate);

    _controller!.addListener(() {
      setState(() {});
    });

    _controller!.forward().whenComplete(() {
      _fadeInController!.forward().whenComplete(navigateToLoginView);
    });
    super.initState();
  }

  void navigateToLoginView() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushNamed(ONBOARDING_VIEW);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Padding(
        padding: EdgeInsets.only(bottom: 35.h, top: 35.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(),
            Transform.translate(
                offset: Offset(0, _animation!.value * 500.h - 500.h),
                child: SvgPicture.asset('assets/images/reserve_logo.svg')),
            Align(
              alignment: Alignment.center,
              child: CustomText(
                'Making your reservation process simpler',
                color: Colors.white.withOpacity(_fadeInController!.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
