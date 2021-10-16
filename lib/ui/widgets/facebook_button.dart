import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class FacebookButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FacebookButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          backgroundColor: const Color(0xFF1877F2),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/facebook_logo.svg',
            ),
            SizedBox(width: 16.w),
            const CustomText(
              'Facebook',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
