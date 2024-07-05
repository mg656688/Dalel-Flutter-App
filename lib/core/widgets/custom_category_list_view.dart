import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({
    super.key,
    required this.categoryList,
    required this.routePath,
  });

  final List<DataModel> categoryList;
  final String routePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: categoryList.isEmpty
          ? const Center(child: Text('No data available'))
          : ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        clipBehavior: Clip.none,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CustomCategoryListViewItem(
            categoryModel: categoryList[index],
            routePath: routePath,
          );
        },
      ),
    );
  }
}
