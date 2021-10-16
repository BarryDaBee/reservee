import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reservee_app/core/exports.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const CustomOutlinedButton({Key? key, @required this.text, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.orange, width: 1),
          backgroundColor: AppColors.orange.withOpacity(0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
        ),
        child: CustomText(
          text,
          fontSize: 16,
          color: AppColors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
