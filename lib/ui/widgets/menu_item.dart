import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

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
                color: AppColors.grey,
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
