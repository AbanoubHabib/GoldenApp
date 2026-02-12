import 'package:flutter/material.dart';

class CustomPriceTextFormatted extends StatelessWidget {
  final String price;
  final String currency;
  final double priceFontSize;
  final double currencyFontSize;
  final FontWeight priceFontWeight;
  final FontWeight currencyFontWeight;
  final Color priceColor;
  final Color currencyColor;

  const CustomPriceTextFormatted({
    super.key,
    required this.price,
    this.currency = 'EGP',
    this.priceFontSize = 32,
    this.currencyFontSize = 14,
    this.priceFontWeight = FontWeight.bold,
    this.currencyFontWeight = FontWeight.w500,
    this.priceColor = Colors.white,
    this.currencyColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            // I make this to add space between price and currency
            text: "$price ",
            style: TextStyle(
              fontSize: priceFontSize,
              fontWeight: priceFontWeight,
              color: priceColor,
            ),
          ),
          TextSpan(
            text: currency,
            style: TextStyle(
              fontSize: currencyFontSize,
              fontWeight: currencyFontWeight,
              color: currencyColor,
            ),
          ),
        ],
      ),
    );
  }
}
