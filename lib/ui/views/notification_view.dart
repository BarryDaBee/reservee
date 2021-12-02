import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservee_app/core/exports.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.left_chevron),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const CustomText(
                "Notifications",
                color: AppColors.darkBlue,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(width: 30),
            ],
          ),
          IntrinsicHeight(
            child: TabBar(
              onTap: (_) {
                setState(() {});
              },
              controller: _tabController,
              indicatorColor: AppColors.orange,
              tabs: [
                Tab(
                  child: CustomText(
                    'Activities',
                    fontSize: 14,
                    color: _tabController.index == 0
                        ? AppColors.black
                        : AppColors.silver,
                    fontWeight:
                        _tabController.index == 0 ? FontWeight.w600 : null,
                  ),
                ),
                Tab(
                  child: CustomText(
                    'Notice',
                    fontSize: 14,
                    color: _tabController.index == 1
                        ? AppColors.black
                        : AppColors.silver,
                    fontWeight:
                        _tabController.index == 1 ? FontWeight.w600 : null,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ActivitiesView(),
                ActivitiesView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.r, vertical: 5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.orange.withOpacity(0.1),
            ),
            child: const CustomText(
              'Older',
              color: AppColors.orange,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return const ActivityCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 16.h,
                );
              },
              itemCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('wallet_pink'.svg),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  'Cuisine',
                  color: AppColors.orange,
                  fontSize: 14,
                ),
                SizedBox(width: 203.w),
                const CustomText(
                  '10/12/2020',
                  color: AppColors.darkGrey,
                  fontSize: 8,
                ),
              ],
            ),
            SizedBox(height: 5.h),
            const CustomText(
              'Reservation',
              fontSize: 12,
              color: AppColors.black,
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 303.w,
              child: const CustomText(
                'Payment of \$3000 was made for the reservation of three tables with a number of 24 people.',
                fontSize: 10,
                color: Color(0xFF7A7A7A),
              ),
            )
          ],
        )
      ],
    );
  }
}
