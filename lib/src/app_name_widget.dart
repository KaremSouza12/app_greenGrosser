import 'package:app_greengrosser/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    this.greenTitleColor,
    this.textSize = 30,
    super.key,
  });

  final Color? greenTitleColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          //Text
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: greenTitleColor ?? CustomColors.customSwatchColor,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: CustomColors.contratstColors,
            ),
          ),
        ],
      ),
    );
  }
}
