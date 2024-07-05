import 'package:dalel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

 @override
 void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      (){
          GoRouter.of(context).push("/OnBoarding");
      },

      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

   return  Scaffold(
    body: Center(
      child: Image.asset(Assets.firstPhoto),

    ),
   );
  }
}