import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class CustomPasswordFieldWithLabel extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final String? label;

  const CustomPasswordFieldWithLabel({
    Key? key,
    this.formKey,
    this.label,
  }) : super(key: key);

  @override
  _CustomPasswordFieldWithLabelState createState() =>
      _CustomPasswordFieldWithLabelState();
}

class _CustomPasswordFieldWithLabelState
    extends State<CustomPasswordFieldWithLabel> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          widget.label,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 48.h,
          child: TextFormField(
            style: const TextStyle(fontSize: 14, color: AppColors.darkBlue),
            obscureText: _obscureText,
            cursorColor: AppColors.orange,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.remove_red_eye),
                color: AppColors.darkBlue,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
