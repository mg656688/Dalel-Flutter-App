import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/presentation/widgets/home_section/egyption_wars_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_section/historical_character_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_section/historical_period_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_section/historical_places_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_section/home_app_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            SliverToBoxAdapter(child: HistoricalCharacterSection()),
            SliverToBoxAdapter(child: EgyptionWarsSection()),
          ],
        ),
      ),
    );
  }
}
