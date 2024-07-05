import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSubTitle extends StatelessWidget {
  const ForgetPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Text("Enter your registered email below to receive password reset instruction",
              style: CustomTextStyles.poppins400style14,
              textAlign: TextAlign.center,
      ),
    );
  }
}