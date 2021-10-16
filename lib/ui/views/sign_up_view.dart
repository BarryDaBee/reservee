import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:reservee_app/ui/widgets/clickable_text.dart';
import 'package:reservee_app/ui/widgets/custom_elevated_button.dart';
import 'package:reservee_app/ui/widgets/custom_password_field_with_label.dart';
import 'package:reservee_app/ui/widgets/custom_switch.dart';
import 'package:reservee_app/ui/widgets/custom_textfield_with_label.dart';
import 'package:reservee_app/ui/widgets/facebook_button.dart';
import 'package:reservee_app/ui/widgets/google_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: kToolbarHeight),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              SizedBox(height: 40.h),
              const CustomText(
                'Create your Account',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 7.h),
              const CustomText(
                'Create an account to have access to reserve a table in various restaurant wherever you are.',
                fontSize: 12,
                color: Color(0xFF818181),
              ),
              SizedBox(height: 32.h),
              const CustomTextFieldWithLabel(
                label: 'Full Name',
                hintText: 'Ex: Stella Watson',
              ),
              SizedBox(height: 24.h),
              const CustomTextFieldWithLabel(
                label: 'E-mail',
                hintText: 'Ex: stellawatson@gmail.com',
              ),
              SizedBox(height: 24.h),
              const CustomTextFieldWithLabel(
                label: 'Phone Number',
                hintText: '0810 000 0000',
              ),
              SizedBox(height: 24.h),
              const CustomTextFieldWithLabel(
                label: 'Country',
                hintText: 'Please select your country',
              ),
              SizedBox(height: 24.h),
              const CustomPasswordFieldWithLabel(
                label: 'Password',
              ),
              SizedBox(height: 24.h),
              const CustomPasswordFieldWithLabel(
                label: 'Confirm Password',
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const CustomSwitch(),
                  SizedBox(
                    width: 8.w,
                  ),
                  const CustomText(
                    'I agree with the terms of use and privacy',
                    fontSize: 12,
                    color: Color(
                      0xFF333333,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              SizedBox(height: 39.h),
              const CustomElevatedButton(
                text: 'Sign Up',
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 140.w,
                    height: 1,
                    color: AppColors.darkBlue.withOpacity(0.1),
                  ),
                  const CustomText(
                    'OR',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: AppColors.darkGrey,
                  ),
                  Container(
                    width: 140.w,
                    height: 1,
                    color: AppColors.darkBlue.withOpacity(0.1),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              const FacebookButton(),
              SizedBox(height: 24.h),
              const GoogleButton(),
              SizedBox(height: 80.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText('Already have an account?'),
                  const SizedBox(width: 5),
                  ClickableText(
                    'Login',
                    fontSize: 14,
                    onTap: () {
                      Navigator.pushNamed(context, LOGIN_VIEW);
                    },
                  ),
                ],
              ),
              SizedBox(height: 39.h),
            ],
          ),
        ),
      ),
    );
  }
}
