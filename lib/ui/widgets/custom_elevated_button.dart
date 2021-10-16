import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reservee_app/core/exports.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  const CustomElevatedButton({Key? key, @required this.text, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          primary: AppColors.orange,
          elevation: 1,
        ),
        child: CustomText(
          text,
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
