import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';

// ignore: non_constant_identifier_names
void OnBoardingVisited(){
   getIt<CacheHelper>().saveData(key: "inOnBoardingVisited",value: true).then((value){
    
   });
}