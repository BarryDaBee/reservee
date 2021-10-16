import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final VoidCallback? onBackArrowPressed;
  CustomAppBar({Key? key, this.onBackArrowPressed})
      : super(
          key: key,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFF333333),
            ),
            onPressed: onBackArrowPressed,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
}
