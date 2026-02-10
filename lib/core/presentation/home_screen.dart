import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldenprice/core/constants/app_assets.dart';
import 'package:goldenprice/core/constants/app_colors.dart';
import 'package:goldenprice/core/constants/app_strings.dart';
import 'package:goldenprice/core/constants/app_text_styles.dart';
import 'package:goldenprice/core/widgets/custom_gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppAssets.balls, fit: BoxFit.fill),
            SizedBox(height: 100),
            SvgPicture.asset(AppAssets.gold3, width: 200, height: 170),
            Text(
              'Welcome To Golden Price App',
              style: AppTextStyles.font22SemiBold.copyWith(fontSize: 17),
            ),
            SizedBox(height: 60),
            CustomGradientButton(
              onPressed: () {},
              textButton: AppStrings.gold,
              buttonColor: const Color.fromARGB(255, 248, 191, 4),
            ),
            SizedBox(height: 33),
            CustomGradientButton(
              onPressed: () {},
              textButton: AppStrings.silver,
              buttonColor: const Color.fromARGB(255, 107, 104, 104),
            ),
          ],
        ),
      ),
    );
  }
}
