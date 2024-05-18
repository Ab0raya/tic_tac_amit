import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac/constants/spacing.dart';
import 'package:tic_tac/core/utils/app_router.dart';

import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_outlined_button.dart';

botDialogue({required context,required String title}){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CustomColors.yellow,
        content: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          width: screenWidth(context) * 0.8,
          height: screenHeight(context) * 0.17,
          child: Column(
            children: [
               Text(
                title,
                style: Styles.textStyle24,
              ),
              (screenHeight(context) * 0.02).sh,
              CustomOutlinedButton(text: 'Easy', onTap: (){context.go(AppRouter.gameViewPath,extra: 1);}),
              CustomOutlinedButton(text: 'Difficult', onTap: (){context.go(AppRouter.gameViewPath,extra: 2);}),
            ],
          ),
        ),
      );
    },
  );
}