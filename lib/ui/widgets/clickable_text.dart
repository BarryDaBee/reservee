import 'package:flutter/material.dart';

import 'package:reservee_app/core/exports.dart';

class ClickableText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final VoidCallback? onTap;
  const ClickableText(this.text, {Key? key, this.onTap, this.fontSize})
      : assert(
            text != null, 'Property \'text\' of ClickableText cannot be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomText(
        text,
        color: AppColors.orange,
        fontSize: fontSize ?? 12,
      ),
    );
  }
}
