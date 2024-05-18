import 'package:flutter/material.dart';
import 'package:tic_tac/constants/media_query.dart';
import 'package:tic_tac/constants/spacing.dart';
import 'package:tic_tac/core/utils/assets_paths.dart';

import 'background_image.dart';
import 'bot_dialogue.dart';
import 'custom_button.dart';
import 'friend_dialogue.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: Images.background1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Images.logo),
            (screenHeight(context) * 0.02).sh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  icon: Images.bot,
                  label: 'BOT',
                  onTap: () {
                    botDialogue(context: context, title: 'Select level');
                  },
                ),
                CustomButton(
                  icon: Images.friend,
                  label: 'FRIEND',
                  onTap: () {
                    friendDialogue(context: context, title: 'enter your names');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
