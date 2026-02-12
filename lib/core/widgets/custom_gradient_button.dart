import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:goldenprice/core/constants/app_text_styles.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    Key? key,
    required this.onPressed,
    this.textButton,
    this.buttonColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String? textButton;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.goldColor,
            AppColors.champagneColor,
            AppColors.bronzeColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          textButton ?? 'Sign in',
          style: AppTextStyles.font22SemiBold.copyWith(
            color: buttonColor ?? Colors.white,
            fontSize: 33,
          ),
          //TextStyle(fontWeight: FontWeight.w700, fontSize: 20,color:buttonColor??Colors.white),
        ),
      ),
    );
  }
}
