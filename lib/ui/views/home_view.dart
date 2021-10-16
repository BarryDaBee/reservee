import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 79.h),
            Row(
              children: [
                Image.asset(
                  'login_image'.png,
                  height: 50.r,
                  width: 50.r,
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomText(
                      'Hello, Stella',
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlue,
                      fontSize: 20,
                    ),
                    SizedBox(height: 5.h),
                    const CustomText(
                      'Let\'s reserve a table for you',
                      color: AppColors.darkBlue,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            const CustomText(
              'Popular',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            // ListView(
            //   shrinkWrap: true,
            //   scrollDirection: Aj]n]
            //   xis.horizontal,
            //   physics: const ClampingScrollPhysics(),
            // ),
          ],
        ),
      ),
    );
  }
}

class PopularRestaurantCard extends StatelessWidget {
  const PopularRestaurantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
