

import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widgets/custom_category_list_view.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EgyptionWars extends StatelessWidget {
  const EgyptionWars({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){
        if (state is GetEgyptionWarsFailure){
          showToast(state.errormassege);
        }
      },
      builder: (context,state){
      
return state is GetEgyptionWarsLoading
    ? const CustomShimmerCategory()
    : CustomCategoryListView(
      categoryList: context.read<HomeCubit>().egyptionWars,
      routePath:"/egyptionWarsDetailsView",
      );  
  });}}
