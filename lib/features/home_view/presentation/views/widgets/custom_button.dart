import 'package:flutter/material.dart';
import 'package:tic_tac/core/utils/styles.dart';

import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.icon, required this.label, required this.onTap});
  final String icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        width:screenWidth(context)*0.4,
        height: screenHeight(context)*0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomColors.yellow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              icon,
              height: screenHeight(context)*0.1,
              width: screenHeight(context)*0.3,
            ),
            Text(label,style: Styles.textStyle29,)
          ],
        ),
      ),
    );
  }
}
