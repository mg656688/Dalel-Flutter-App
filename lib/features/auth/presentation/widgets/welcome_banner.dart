import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 250,
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppStrings.app_name,
              style: CustomTextStyles.poppins700style32,
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.imagesVector2),
              SvgPicture.asset(Assets.imagesVector1),
            ],
          )
        ],
      ),
    );
  }
}