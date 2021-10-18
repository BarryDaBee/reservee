import 'package:flutter/material.dart';
import 'package:reservee_app/core/exports.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const CustomText(this.text,
      {Key? key,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.textAlign,
      this.overflow})
      : assert(text != null, 'Property text of custom text cannot be null'),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize?.sp,
        color: color ?? AppColors.darkBlue,
        fontWeight: fontWeight,
        fontFamily: 'Gilroy',
      ),
    );
  }
}
