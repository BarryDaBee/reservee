import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:reservee_app/ui/widgets/menu_item.dart';

class RestaurantInfoView extends StatefulWidget {
  const RestaurantInfoView({Key? key}) : super(key: key);

  @override
  State<RestaurantInfoView> createState() => _RestaurantInfoViewState();
}

class _RestaurantInfoViewState extends State<RestaurantInfoView>
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
                  onPressed: () {
                    Navigator.pushNamed(context, reserveSpaceView);
                  },
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
            TabBar(
              controller: _tabController,
              indicatorColor: AppColors.orange,
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              unselectedLabelColor: const Color(0xFFE0E0E0),
              labelStyle: const TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              labelColor: AppColors.darkBlue,
              tabs: const [
                Tab(
                  text: 'Info',
                ),
                Tab(
                  text: 'Menu',
                ),
                Tab(
                  text: 'Reviews',
                ),
              ],
            ),
            const Divider(
              height: 0,
            ),
            SizedBox(
              height: 367.h,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  InfoBody(),
                  MenuBody(),
                  ReviewsBody(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  final List<List<String>> restaurantMenuItems = [
    ['Amala and Gbegiri', 'Jollof Rice', 'Fufu and Ewedu', 'Iyan and Efo'],
    ['Chicken', 'Turkey', 'Beef', 'Goat meat', 'MoiMoi', 'Plantain'],
    ['Palm Wine', 'Zobo/Sorrel', 'Chapman'],
    ['Meat Pie', 'Chicken Pie', 'Chinchin', 'Puffpuff', 'Coconut Candy'],
  ];

  List<String>? dropdownValue;

  @override
  initState() {
    dropdownValue = restaurantMenuItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(dropdownValue);
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 24.h),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 24,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.5),
            decoration: BoxDecoration(
              color: AppColors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<List<String>>(
                elevation: 8,
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  color: AppColors.orange,
                  size: 12,
                ),
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                items: [
                  DropdownMenuItem<List<String>>(
                    value: restaurantMenuItems[0],
                    child: const CustomText(
                      'Main Course',
                      fontSize: 12,
                      color: AppColors.orange,
                    ),
                  ),
                  DropdownMenuItem<List<String>>(
                    value: restaurantMenuItems[1],
                    child: const CustomText(
                      'Add on',
                      fontSize: 12,
                      color: AppColors.orange,
                    ),
                  ),
                  DropdownMenuItem<List<String>>(
                    value: restaurantMenuItems[2],
                    child: const CustomText(
                      'Drinks',
                      fontSize: 12,
                      color: AppColors.orange,
                    ),
                  ),
                  DropdownMenuItem<List<String>>(
                    value: restaurantMenuItems[3],
                    child: const CustomText(
                      'Snacks',
                      fontSize: 12,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 18.h),
        const MenuItem(
          itemName: 'Chicken',
          imageUrl: 'chicken',
        ),
        SizedBox(height: 20.h),
        const MenuItem(
          itemName: 'Turkey',
          imageUrl: 'turkey',
        ),
        SizedBox(height: 20.h),
        const MenuItem(
          itemName: 'Beef',
          imageUrl: 'beef',
        ),
        SizedBox(height: 20.h),
        const MenuItem(
          itemName: 'Goat meat',
          imageUrl: 'chevon',
        ),
        SizedBox(height: 20.h),
        const MenuItem(
          itemName: 'Moimoi',
          imageUrl: 'moi_moi',
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class InfoBody extends StatelessWidget {
  const InfoBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Container(
          //margin: EdgeInsets.all(24.h),
          padding: EdgeInsets.all(24.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.orange.withOpacity(0.15),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('location'.svg),
                  SizedBox(width: 8.w),
                  const CustomText(
                    '3891 Ranchview Dr. Richardson, California ',
                    fontSize: 12,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SvgPicture.asset('clock'.svg),
                  SizedBox(width: 8.w),
                  const CustomText(
                    '09.00 am-00.00am',
                    fontSize: 12,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SvgPicture.asset('phone'.svg),
                  SizedBox(width: 8.w),
                  const CustomText(
                    '(808) 555-0111',
                    fontSize: 12,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  SvgPicture.asset('location'.svg),
                  SizedBox(width: 8.w),
                  const CustomText(
                    'www.eatee.com',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        const CustomText(
          'Eatee is a Nigerian food restaurant dedicated to serving native delicacies to Nigerian food lovers and enthusiasts. \nTheir menu has a wide array of tasty indigenous tribes meals and drinks to go with. \n\nEatee is the first and go to restaurant for Nigerian meals.',
          fontSize: 12,
          color: AppColors.grey,
        )
      ],
    );
  }
}

class ReviewsBody extends StatelessWidget {
  const ReviewsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    5,
                    (index) => SizedBox(
                      height: 10.r,
                      width: 10.r,
                      child: SvgPicture.asset('star'.svg),
                    ),
                  ),
                  const Spacer(),
                  const CustomText('19th of Jan, 2021',
                      fontSize: 10, color: AppColors.black)
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: CustomText(
                      'Their Customer service is top notch and they sell very nice dishes. I recommend them',
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              const CustomText(
                'by Richard',
                fontSize: 12,
                color: AppColors.grey,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 23.h);
        },
        itemCount: 10);
  }
}
