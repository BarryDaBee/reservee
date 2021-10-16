import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:reservee_app/ui/widgets/custom_appbar.dart';
import 'package:reservee_app/ui/widgets/custom_elevated_button.dart';
import 'package:reservee_app/ui/widgets/custom_textfield_with_label.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackArrowPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomText(
              'Reset Password',
              color: AppColors.darkBlue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 7.h),
            const CustomText(
              'Enter your email to get your reset code',
              color: AppColors.grey,
              fontSize: 12,
            ),
            SizedBox(height: 40.h),
            const CustomTextFieldWithLabel(
              label: 'Email',
              hintText: 'johndoe@gmail.com',
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              text: 'Send Reset Code',
              onPressed: () {
                Navigator.pushNamed(context, CHANGE_PASSWORD_VIEW);
              },
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  '- Or ',
                  color: Color(0xFFBDBDBD),
                ),
                InkWell(
                  child: const CustomText('sign up ', color: AppColors.orange),
                  onTap: () {
                    Navigator.pushNamed(context, SIGN_UP_VIEW);
                  },
                ),
                const CustomText(
                  '-',
                  color: Color(0xFFBDBDBD),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
