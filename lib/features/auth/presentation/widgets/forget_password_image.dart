import 'package:dalel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ForgetPasswordImage extends StatelessWidget {
  const ForgetPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 230,
      child: Image.asset(Assets.imagesForgetPassword),);
  }
}