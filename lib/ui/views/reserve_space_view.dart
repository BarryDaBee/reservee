import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class ReserveSpaceView extends StatefulWidget {
  const ReserveSpaceView({Key? key}) : super(key: key);

  @override
  State<ReserveSpaceView> createState() => _ReserveSpaceViewState();
}

class _ReserveSpaceViewState extends State<ReserveSpaceView>
    with TickerProviderStateMixin {
  TabController? _tabController;

  PageController? _pageController;

  int _currentPage = 0;

  @override
  initState() {
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 30.h),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const Spacer(),
                SvgPicture.asset('heart_icon_alt'.svg)
              ],
            ),
            SizedBox(height: 19.h),
            Align(
              alignment: Alignment.center,
              child: PhysicalModel(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightOrange,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: 295.w,
                    height: 346.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PageView(
                          controller: _pageController,
                          onPageChanged: (newPage) {
                            setState(() {
                              _currentPage = newPage;
                            });
                          },
                          children: [
                            Image.asset(
                              'eatee'.png,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'cuisinee'.png,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'eatee_2'.png,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'eatee_2'.png,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10.h,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) => Container(
                                height: 3.h,
                                width: 14.w,
                                margin: EdgeInsets.only(right: 4.w),
                                decoration: BoxDecoration(
                                  color: _currentPage == index
                                      ? AppColors.lightOrange
                                      : Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      'Eatee',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const CustomText(
                          'African Dishes',
                          fontSize: 12,
                          color: Color(0xFF818181),
                        ),
                        SizedBox(width: 3.w),
                        Container(
                          height: 14.h,
                          width: 1.w,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 3.w),
                        const CustomText(
                          'Drinks',
                          fontSize: 12,
                          color: Color(0xFF818181),
                        ),
                        SizedBox(width: 3.w),
                        Container(
                          height: 14.h,
                          width: 1.w,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 3.w),
                        const CustomText(
                          'Desserts',
                          fontSize: 12,
                          color: Color(0xFF818181),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset('star'.svg),
                        SizedBox(width: 5.w),
                        SvgPicture.asset('star'.svg),
                        SizedBox(width: 5.w),
                        SvgPicture.asset('star'.svg),
                        SizedBox(width: 5.w),
                        SvgPicture.asset('star'.svg),
                        SizedBox(width: 5.w),
                        SvgPicture.asset('star'.svg),
                        SizedBox(width: 5.w),
                        const CustomText(
                          '2k Reviews',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4F4F4F),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.orange,
                  ),
                  onPressed: () {},
                  child: const CustomText(
                    'Reserve',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
