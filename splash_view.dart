import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 @override
 void initState() {
   bool inOnBoardingVisited = 
   getIt<CacheHelper>().getData(key: "inOnBoardingVisited")??false;
   if (inOnBoardingVisited == true){
    FirebaseAuth.instance.currentUser==null?
     delayedNavigate(context, "/signIn")
     : FirebaseAuth.instance.currentUser!.emailVerified == true?
      delayedNavigate(context , "/homeNavBar") : 
      delayedNavigate(context, "/signIn");
   }else{
      delayedNavigate(context, "/onBoarding");
   }
   
    super.initState();
  }

 
 
  @override
  Widget build(BuildContext context) {
    
   return  Scaffold(
    body: Center(
      child: Text(
        // Image.asset(Assets.)
        AppStrings.app_name,
              style : CustomTextStyles.pacifico400style64.copyWith(fontWeight: FontWeight.bold),



      ),  
      
    ),
   );
  }}
 
void delayedNavigate(context,path) {
   Future.delayed(
     const Duration(seconds: 2),
     (){
         customReplacementNavigate(context,path);
     },
     
     );
 }
 