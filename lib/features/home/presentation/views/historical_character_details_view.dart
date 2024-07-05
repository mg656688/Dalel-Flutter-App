import 'package:dalel/features/home/data/models/historical_character_model.dart';
import 'package:dalel/features/home/presentation/widgets/home_section/home_app_bar_section.dart';
import 'package:dalel/features/home/presentation/widgets/period_character_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class HistoricalCharactersDetailsView extends StatelessWidget {
  const HistoricalCharactersDetailsView({super.key, required this.charactersModel});
  final HistoricalCharactersModel charactersModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.app_name,
            style: CustomTextStyles.pacifico400style64.copyWith(fontSize: 22)),
        leadingWidth: 48,
        backgroundColor: AppColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SvgPicture.asset(Assets.menu),
          )
        ],
      ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal:16.0),
         child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 32,),),
              SliverToBoxAdapter(
                child: PeriodCharactersSection(
                  charactersName: charactersModel.name, 
                  description: charactersModel.description, 
                  imageUrl: charactersModel.image),
                  ),
                   const SliverToBoxAdapter(child: SizedBox(height: 22),),
          ],
         ),
       ), 
    );
  }
}