import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget{
     const OnBoardingWidgetBody ({super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
     
     return SizedBox(
      height: 500,
     child: PageView.builder(
      onPageChanged: onPageChanged,
      physics: const BouncingScrollPhysics(),
       controller: controller,
     itemCount: OnBoardingData.length,
     itemBuilder: (context,index){
       return Column(
         children: [
           Container(
            height: 270,
            width: 343,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  OnBoardingData[index].imagePath,
                ),
                fit: BoxFit.fill,
              ),
              
            ),
           ),
         
           const SizedBox(height: 10),
           CustomSmoothPageIndecator(controller: controller),
            const SizedBox(height: 47),
            Text(
           OnBoardingData[index].title,
             style: CustomTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
             textAlign: TextAlign.center,
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
           ),
            const SizedBox(height: 30,),
            Text(
              OnBoardingData[index].subtitle,
           style: CustomTextStyles.poppins300style16,
           textAlign: TextAlign.center,
           ),
            const SizedBox(height: 20,)
         ],
     );
     },
     ),);
  }

}
