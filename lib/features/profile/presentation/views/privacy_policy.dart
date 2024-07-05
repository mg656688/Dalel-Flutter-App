import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: AppColors.primaryColor,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal :16.0),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 300, 
            child: Text(
              '- Access Your Information: You can access your personal information and search history through our app.\n'
              "\n"
              '- Correct Your Information: You can correct any inaccuracies in your personal information through our app.\n'
              "\n"
              '- Delete Your Information: You can delete your account and personal information through our app.\n'
              "\n"
              '- Encryption: We encrypt your personal information and search history when it is transmitted over the internet.\n'
              "\n"
              '- Firewalls: We use firewalls to protect our servers from unauthorized access.'
              ,
              overflow: TextOverflow.ellipsis,
              maxLines: 25,
              style: CustomTextStyles.poppins500style18.copyWith(color: AppColors.deepBrown, ),
               ),
          ),
           ),
      ),);
      }
}