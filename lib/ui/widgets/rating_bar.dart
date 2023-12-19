import 'package:bloc_fake_store_api/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final int maxRating;

  RatingBar({required this.rating, this.maxRating = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxRating, (index) {
        if (index < rating.floor()) {
          return Icon(
            Icons.star,
            color: AppColors.colorYellow,
            size: 32.px,
          );
        } else if (index == rating.floor() && rating % 1 != 0) {
          return Icon(
            Icons.star_half,
            color: AppColors.colorYellow,
            size: 32.px,
          );
        } else {
          return Icon(
            Icons.star_outline,
            color: AppColors.colorYellow,
            size: 32.px,
          );
        }
      }),
    );
  }
}
