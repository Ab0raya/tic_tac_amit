import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_paths.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import 'bot_game_sign.dart';

class BotGameScoreBoard extends StatelessWidget {
  const BotGameScoreBoard({super.key, required this.isXTurn});
  final bool isXTurn;
  @override
  Widget build(BuildContext context) {
    print(isXTurn);
    print('game score board');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         BotGameSign(
          isXTurn: !isXTurn,
          name: 'Bot',
          image: Images.bot,
          letter: 'O',
          backgroundColor: CustomColors.yellow,
          textColor: CustomColors.blue,
          shadowColor: CustomColors.blue,
        ),
        Text(
          'vs',
          style: Styles.textStyle29.copyWith(fontSize: 73, color: Colors.white),
        ),
         BotGameSign(
          name: 'you',
          image: Images.player1,
          letter: 'X',
          backgroundColor: CustomColors.blue,
          textColor: CustomColors.yellow,
          isXTurn: isXTurn,
          shadowColor: CustomColors.yellow,
        ),
      ],
    );
  }
}
