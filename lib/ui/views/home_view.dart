import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:reservee_app/ui/widgets/all_restaurants_card.dart';
import 'package:reservee_app/ui/widgets/popular_restaurant_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 30.h),
            Row(
              children: [
                SizedBox(
                  height: 54.r,
                  width: 54.r,
                  child: Stack(
                    children: [
                      Container(
                        height: 50.r,
                        width: 50.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFFE0E0E0),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4.r,
                        left: 4.r,
                        child: Image.asset(
                          'user_image'.png,
                          height: 50.r,
                          width: 50.r,
                        ),
                      ),
                    ],
                  ),
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
                const Spacer(),
                InkWell(
                  child: SvgPicture.asset('notification'.svg),
                  onTap: () {
                    Navigator.pushNamed(context, notificationView);
                  },
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              height: 40,
              alignment: Alignment.center,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.silver,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 18.w),
                  SvgPicture.asset('search'.svg),
                  SizedBox(
                    width: 12.w,
                  ),
                  const CustomText(
                    'Search Restaurant',
                    fontSize: 12,
                    color: AppColors.silver,
                  )
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                const CustomText(
                  'Popular',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, allRestaurantView,
                          arguments: {"title": "Popular"});
                    },
                    child: SvgPicture.asset('right_arrow'.svg)),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 210.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) =>
                    PopularRestaurantCard(),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 16.w),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const CustomText(
                  'Close to You',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, allRestaurantView,
                          arguments: {"title": "Close to you"});
                    },
                    child: SvgPicture.asset('right_arrow'.svg)),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 210.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) =>
                    PopularRestaurantCard(),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 16.w),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const CustomText(
                  'All Restaurants',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      allRestaurantView,
                      arguments: {"title": "All Restaurants"},
                    );
                  },
                  child: SvgPicture.asset('right_arrow'.svg),
                ),
              ],
            ),
            Row(
              children: [
                const AllRestaurantsCard(),
                SizedBox(width: 15.w),
                Column(
                  children: [
                    SizedBox(height: 34.h),
                    const AllRestaurantsCard(),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
