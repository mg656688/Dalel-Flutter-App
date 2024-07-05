import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/egyption_wars.dart';
import 'package:flutter/material.dart';

class EgyptionWarsSection extends StatelessWidget {
  const EgyptionWarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16,),
        CustomHeaderText(text: AppStrings.egyptionwars),
        SizedBox(height: 16,),
        EgyptionWars(),
        SizedBox(height: 32,),
      ],
    );
  }
}