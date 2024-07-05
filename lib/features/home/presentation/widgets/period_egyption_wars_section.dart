import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:flutter/material.dart';

class PeriodEgyptionWarsSection extends StatelessWidget {
  const PeriodEgyptionWarsSection({
    Key? key,
    required this.egyptionWarsName,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  final String egyptionWarsName;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomHeaderText(text: "${AppStrings.about}$egyptionWarsName"),
          ],
        ),
        const SizedBox(height: 24,),
        Center(
          child: AspectRatio(
            aspectRatio: 0.90, // Adjust aspect ratio as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    maxLines: 30,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.poppins500style18.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
