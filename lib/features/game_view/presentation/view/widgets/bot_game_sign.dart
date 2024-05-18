import 'package:flutter/material.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
class BotGameSign extends StatelessWidget {
  const BotGameSign({super.key, required this.name, required this.image, required this.letter, required this.backgroundColor, required this.textColor, required this.isXTurn, required this.shadowColor});
  final String name;
  final String image;
  final String letter;
  final Color backgroundColor;
  final Color textColor;
  final Color shadowColor;
  final bool isXTurn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          width: screenWidth(context)*0.23,
          height: screenHeight(context)*0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
               image,
                height: 55,
                width: 55,
              ),
               Container(
                 decoration: BoxDecoration(
                   boxShadow: [
                     BoxShadow(
                       color: isXTurn? shadowColor.withOpacity(0.4) : Colors.transparent,
                       blurRadius: 15,
                       spreadRadius: 30,
                       offset: const Offset(0, 30),

                     ),
                   ],
                 ),
                   child: Text(name,style: Styles.textStyle29.copyWith(color: textColor)))
            ],
          ),
        ),
         Text(letter,style: Styles.textStyle40.copyWith(color: textColor),)
      ],
    );
  }
}
