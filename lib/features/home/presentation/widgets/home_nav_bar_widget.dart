import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/historical_places_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9),
          topRight: Radius.circular(9),
          ),
          ),
      );
  }
}
List<Widget> _buildScreens() {
  final cubit = HomeCubit();

  cubit.getHistoricalPeriods();
  cubit.getHistoricalCharacters();
  cubit.getEgyptionWars();

  return [
    BlocProvider.value(
      value: cubit,
      child: const HomeView(),
    ),
    const HistoricalPlacesPage(),
    ProfilePage(),
  ];
}


  List<PersistentBottomNavBarItem> _navBarsItems(){
    return[
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.homeActive),
        inactiveIcon: SvgPicture.asset(Assets.home),
      ),


       PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.searchActive),
        inactiveIcon: SvgPicture.asset(Assets.search),
      ),

       PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.profieActive),
        inactiveIcon: SvgPicture.asset(Assets.profile),
      ),
    ];
  }