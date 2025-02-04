import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_check_bok.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
     children: [
       const CustomCheckBox(),
       Text.rich(TextSpan(
        children :[
            TextSpan(
              text: AppStrings.ihaveagreetoour,
              style: CustomTextStyles.poppins400style16.copyWith(fontSize:12 ),
            ),
            TextSpan(
              text: AppStrings.termsandcondition,
              style: CustomTextStyles.poppins400style16.copyWith(fontSize: 12,decoration: TextDecoration.underline),
              
              ),
        ]
      ))
     ],
    );
  }
}