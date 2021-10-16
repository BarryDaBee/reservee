import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String? label;
  final String? hintText;
  const CustomTextFieldWithLabel(
      {Key? key, this.label, this.formKey, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          label,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 48.h,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkBlue,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
            ),
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            cursorColor: AppColors.orange,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16.w),
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.darkBlue.withOpacity(0.6),
                fontFamily: 'Gilroy',
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
