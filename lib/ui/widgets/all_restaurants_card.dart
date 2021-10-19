import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:reservee_app/ui/views/restaurant_info_view.dart';

class AllRestaurantsCard extends StatefulWidget {
  const AllRestaurantsCard({Key? key}) : super(key: key);

  @override
  State<AllRestaurantsCard> createState() => _AllRestaurantsCardState();
}

class _AllRestaurantsCardState extends State<AllRestaurantsCard> {
  final List<String> images = ['eatee', 'eatee_2', 'cuisinee'];

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: const RestaurantInfoView(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: SizedBox(
        height: 162.h,
        width: 160.w,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(colors: [
                AppColors.black.withOpacity(0.75),
                AppColors.black.withOpacity(0.75),
              ]).createShader(bounds),
              child: Container(
                height: 162.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      images[random.nextInt(3)].png,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 14.h, right: 9.w, left: 10.w, bottom: 11.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: LikeHeart(
                        onTap: (value) {},
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CustomText(
                    'Food Sparks',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.h),
                  const CustomText(
                    '38 Riverview, Richardson.',
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('star'.svg),
                      SizedBox(width: 5.w),
                      const CustomText(
                        '3.2 (50)',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LikeHeart extends StatefulWidget {
  const LikeHeart({Key? key, this.onTap}) : super(key: key);
  final ValueChanged<bool>? onTap;

  @override
  _LikeHeartState createState() => _LikeHeartState();
}

class _LikeHeartState extends State<LikeHeart>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _controller;
  late Animation _sizeTween;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _sizeTween = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 20, end: 30), weight: 50),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 30, end: 20), weight: 50),
      ],
    ).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
        isLiked ? _controller.forward() : _controller.reverse();
        // if (widget.onTap != null) {
        widget.onTap?.call(isLiked);
      },
      child: SizedBox(
        width: _sizeTween.value,
        height: _sizeTween.value,
        child: SvgPicture.asset(
            isLiked ? 'heart_active'.svg : 'heart_inactive'.svg),
      ),
    );
  }
}
