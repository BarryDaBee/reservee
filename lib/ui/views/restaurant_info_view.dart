import 'package:reservee_app/core/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RestaurantInfoView extends StatefulWidget {
  const RestaurantInfoView({Key? key}) : super(key: key);

  @override
  State<RestaurantInfoView> createState() => _RestaurantInfoViewState();
}

class _RestaurantInfoViewState extends State<RestaurantInfoView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      vsync: this,
      length: 3,
    );
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
                    Navigator.pushNamed(context, RESTAURANT_INFO_VIEW);
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
                color: AppColors.grey,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'eatee'.png,
                    fit: BoxFit.cover,
                    width: 295.w,
                    height: 346.h,
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
                          fontWeight: FontWeight.w500,
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
            SizedBox(height: 25.h),
            Card(
              elevation: 0.5,
              child: TabBar(
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
            ),
            SizedBox(
              height: 367.h,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const InfoBody(),
                  const MenuBody(),
                  Container(),
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

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String? itemName;

  const MenuItem({Key? key, required this.imageUrl, this.itemName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl.png,
          height: 76.r,
          width: 76.r,
        ),
        SizedBox(width: 14.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              itemName,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 243.w,
              child: const CustomText(
                'This is pounded yam paired with vegetable soup. it is a royal meal taken with palm wine.',
                color: AppColors.darkBlue,
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 6.h),
            const CustomText(
              '\$300',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black,
            ),
          ],
        ),
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
          // margin: EdgeInsets.all(24.h),
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
