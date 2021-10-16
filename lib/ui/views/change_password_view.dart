import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:reservee_app/ui/widgets/custom_appbar.dart';
import 'package:reservee_app/ui/widgets/custom_elevated_button.dart';
import 'package:reservee_app/ui/widgets/custom_password_field_with_label.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

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
              'Set your new password',
              color: AppColors.grey,
              fontSize: 12,
            ),
            SizedBox(height: 31.h),
            const CustomPasswordFieldWithLabel(
              label: 'New Password',
            ),
            SizedBox(height: 24.h),
            const CustomPasswordFieldWithLabel(
              label: 'Confirm New Password',
            ),
            SizedBox(height: 40.h),
            const CustomElevatedButton(text: 'Change Password'),
          ],
        ),
      ),
    );
  }
}
