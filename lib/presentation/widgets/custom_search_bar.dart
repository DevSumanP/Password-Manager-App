import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:password_manager/core/constants/app_colors.dart';
import 'package:password_manager/core/constants/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  const CustomSearchBar({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: searchController,
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: 'Search Accounts...',
          hintStyle: AppTextStyles.subtitle1,
          prefixIcon:
              const Icon(IconlyBroken.search, color: AppColors.textLightColor),
          suffixIcon:
              const Icon(IconlyBroken.scan, color: AppColors.textLightColor),
          filled: true,
          fillColor: AppColors.cardBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
