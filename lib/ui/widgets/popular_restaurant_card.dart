import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class PopularRestaurantCard extends StatelessWidget {
  PopularRestaurantCard({Key? key}) : super(key: key);

  final List<String> images = ['eatee', 'eatee_2', 'cuisinee'];
  final List<String> restaurants = ['Eatee', 'Cuisine', 'Crofty Pub'];

  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            images[random.nextInt(3)].png,
            height: 120.r,
            width: 120.r,
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(
          restaurants[random.nextInt(3)],
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.darkBlue,
        ),
        SizedBox(height: 3.h),
        const CustomText(
          '38 Riverview, Richardson',
          fontSize: 10,
          color: AppColors.lessBlack,
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('star'.svg),
            SizedBox(width: 5.w),
            const CustomText(
              '3.2',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.lessBlack,
            ),
          ],
        ),
      ],
    );
  }
}
