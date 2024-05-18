import 'package:flutter/material.dart';

import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          fixedSize: Size(
              screenWidth(context) * 0.7,
              screenHeight(context) * 0.04),
          side: const BorderSide(
            color: CustomColors.blue,
            width: 3,
          )),
      onPressed: onTap,
      child:  Text(text,style: Styles.textStyle21,),
    );
  }
}
