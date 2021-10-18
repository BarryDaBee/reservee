import 'package:flutter/material.dart';
import 'package:reservee_app/ui/widgets/all_restaurants_card.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:flutter/cupertino.dart';

class AllRestaurantsView extends StatelessWidget {
  const AllRestaurantsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;

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
                SvgPicture.asset('notification'.svg),
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
                SvgPicture.asset('categories'.svg),
                SizedBox(width: 18.w),
                const CustomDropdown(
                  items: ['Ratings'],
                ),
                SizedBox(width: 16.w),
                const CustomDropdown(
                  items: [
                    'Price',
                    'Price1',
                    'Price2',
                    'Price3',
                  ],
                ),
                SizedBox(width: 16.w),
                const CustomDropdown(
                  items: [
                    'Time',
                    'Time1',
                    'Time2',
                    'Time3',
                  ],
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomText(
              arguments['title'] ?? 'All Restaurants',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    AllRestaurantsCard(),
                    SizedBox(height: 16.h),
                    AllRestaurantsCard(),
                    SizedBox(height: 16.h),
                    AllRestaurantsCard(),
                    SizedBox(height: 16.h),
                    AllRestaurantsCard(),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 36.h),
                    AllRestaurantsCard(),
                    SizedBox(height: 16.h),
                    AllRestaurantsCard(),
                    SizedBox(height: 16.h),
                    AllRestaurantsCard(),
                    SizedBox(height: 16.h),
                    AllRestaurantsCard(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<String> items;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String dropdownValue = '';
  @override
  void initState() {
    dropdownValue = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 0.5, color: Colors.black),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(
                CupertinoIcons.chevron_down,
                size: 15,
              ),
              items: widget.items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CustomText(
                    value,
                    fontSize: 14,
                  ),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  dropdownValue = _!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
