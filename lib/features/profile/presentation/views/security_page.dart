import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
        backgroundColor: AppColors.primaryColor,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 300,
            child: Text(
              '1. Authentication and Authorization\n'
              "\n"
              '2. Data Encryption\n'
              "\n"
              '3. Input Validation and Sanitization\n'
              "\n"
              '4. Secure Communication\n'
               "\n"
              '5. Secure Storage\n'
               "\n"
              '6. Regular Security Updates\n'
               "\n"
              '7. Incident Response\n'
               "\n"
              '8. Access Control\n'
               "\n"
              '9. Logging and Monitoring\n'
               "\n"
             '10. Compliance',
          
        overflow: TextOverflow.ellipsis,
        maxLines: 20,        
                      style: CustomTextStyles.poppins500style18.copyWith(color: AppColors.deepBrown, ),
        
              
              ),
          ),
        ),
      ),
    );
  }
}