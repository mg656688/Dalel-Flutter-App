import 'package:dalel/core/utils/app_assets.dart';

class OnBoardingModuel{
  final String imagePath;
  final String title;
  final String subtitle;

  OnBoardingModuel({
    required this.imagePath, 
    required this.title,
     required this.subtitle
     });
}
// ignore: non_constant_identifier_names
List<OnBoardingModuel> OnBoardingData = [
OnBoardingModuel(
  imagePath: Assets.imagesOnBoardingPng,
  title: "Explore The history with Dalel in a smart way",
  subtitle: "Using our app’s history libraries you can find many historical periods"
  ),

OnBoardingModuel(
  imagePath: Assets.imagesBoy, 
  title: "From every place on THE EARTH!",
  subtitle: "A big variety of ancient places from all over the world"
  ),

  OnBoardingModuel(
  imagePath: Assets.imagesGirl, 
  title: "Using modern AI technology for better user experience", 
  subtitle: "AI provide recommendations and helps you to continue the search journey"
  )

];