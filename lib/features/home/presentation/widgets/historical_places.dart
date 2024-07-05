// import 'package:dalel/core/functions/custom_toast.dart';
// import 'package:dalel/core/widgets/custom_category_list_view.dart';
// import 'package:dalel/core/widgets/custom_shimmer_category.dart';
// import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
// import 'package:dalel/features/home/presentation/cubit/home_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class HistoricalPlaces extends StatelessWidget {
//   const HistoricalPlaces({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit,HomeState>(
//       listener: (context,state){
//         if (state is GetHistoricalPlacesFailure){
//           showToast(state.errormassege);
//         }
//       },
//       builder: (context,state){
//     return state is GetHistoricalPlacesLoading
//     ? const CustomShimmerCategory()
//     : CustomCategoryListView(
//       categoryList: context.read<HomeCubit>().historicalPlaces,
//       routePath:"/historicalPlacesDetailsView",
//       );
//   });}}
//
