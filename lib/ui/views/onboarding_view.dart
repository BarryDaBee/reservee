import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:reservee_app/ui/widgets/custom_elevated_button.dart';
import 'package:reservee_app/ui/widgets/custom_outlined_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: kToolbarHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/images/reserve_logo_orange.svg',
                width: 35,
                height: 32,
              ),
            ),
            SizedBox(height: 43.h),
            Image.asset(
              'assets/images/login_image.png',
              width: 302.w,
              height: 325.h,
            ),
            SizedBox(height: 48.h),
            const CustomText(
              'Reserve a table',
              color: AppColors.orange,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            const CustomText(
              'Secure a comfortable spot with a nice view in your favourite african restaurant anywhere you are.',
              fontSize: 14,
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, SIGN_UP_VIEW);
              },
            ),
            SizedBox(height: 24.h),
            CustomOutlinedButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, LOGIN_VIEW);
              },
            ),
          ],
        ),
      ),
    );
  }
}
