import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
class CustomBtn extends StatelessWidget{
  const CustomBtn({super.key,required this.text,this.onPressed,  this.color});
  final String text;
  final Color?  color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
     child: ElevatedButton(
      onPressed: onPressed,
     style: ElevatedButton.styleFrom(
      backgroundColor:color??AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
     ),

     child: Text(
      text,
      style: CustomTextStyles.poppins500style24.copyWith(
        fontSize: 18,
        color: AppColors.offWhite
        
        ),
      )
     ),);
  }
  }
  
