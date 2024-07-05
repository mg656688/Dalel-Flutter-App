import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class GetButtons extends StatelessWidget{
  const GetButtons({super.key,required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if(currentIndex==OnBoardingData.length-1) {
     
     return  Column(
              children:  [
                CustomBtn(
                text: AppStrings.createAccount,
                onPressed: () {
                  OnBoardingVisited();
                  customReplacementNavigate(context,"/signUp");
                },
                ),
                const SizedBox(height:10 ,),
                CustomBtn(
                  color: AppColors.deepBrown,
                  text: AppStrings.login,
                  onPressed: () {
                    OnBoardingVisited();
                    customReplacementNavigate(context,"/signIn");
                  },
                ),
                const SizedBox(height: 32,),
                 GestureDetector(
                  onTap: (){
                    OnBoardingVisited();
                    customReplacementNavigate(context, "/homeNavBar");
                  },
                   child: Text(
                    AppStrings.continueAsVisitor ,
                    style: CustomTextStyles.poppins300style16.copyWith(fontWeight:FontWeight.w600),
                    ),
                 ),
                 const SizedBox(height: 10,)
              ],
            );
           } else {
              return CustomBtn(
              text: AppStrings.next,
               onPressed: () {
               controller.nextPage(
                duration: const Duration(microseconds: 200), curve: Curves.bounceIn,
            );},);
            }
    }
   
  }