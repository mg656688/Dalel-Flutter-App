import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/historical_character.dart';
import 'package:flutter/material.dart';

class HistoricalCharacterSection extends StatelessWidget {
  const HistoricalCharacterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      CustomHeaderText(text: AppStrings.historicalCharacters),
      SizedBox(height: 16,),
      HistoricalCharacters(),
      SizedBox(height: 32,)
     ],
    );
}
}
