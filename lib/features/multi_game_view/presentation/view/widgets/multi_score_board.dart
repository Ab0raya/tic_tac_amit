import 'package:flutter/material.dart';
import 'package:tic_tac/features/multi_game_view/data/player_model.dart';

import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class MultiScoreBoard extends StatelessWidget {
  const MultiScoreBoard(
      {super.key, required this.player1, required this.player2, required this.isXTurn});

  final Player player1;
  final Player player2;
  final bool isXTurn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: screenWidth(context) * 0.15),
                      alignment: Alignment.center,
                      width: 260,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: CustomColors.blue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        player1.name,
                        style: Styles.textStyle21
                            .copyWith(color: CustomColors.yellow),
                      ),
                    ),
                    Text(
                      '  X',
                      style: Styles.textStyle40
                          .copyWith(color: CustomColors.yellow),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: isXTurn ? CustomColors.yellow.withOpacity(0.4) : Colors.transparent,
                        blurRadius: 15,
                        spreadRadius: 30,
                      ),
                    ]
                  ),
                  child: CircleAvatar(
                    radius: (screenArea(context) / 250) * 0.02,
                    backgroundColor: CustomColors.yellow,
                    backgroundImage: AssetImage(player1.image),
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          'vs',
          style: Styles.textStyle40.copyWith(color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Row(
                  children: [
                    const Text(
                      'O  ',
                      style: Styles.textStyle40,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(right: screenWidth(context) * 0.15),
                      alignment: Alignment.center,
                      width: 260,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: CustomColors.yellow,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Text(
                        player2.name,
                        style: Styles.textStyle21
                            .copyWith(color: CustomColors.blue),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: !isXTurn ? CustomColors.blue.withOpacity(0.4) : Colors.transparent,
                          blurRadius: 15,
                          spreadRadius: 30,
                        ),
                      ]
                  ),
                  child: CircleAvatar(
                    radius: (screenArea(context) / 250) * 0.02,
                    backgroundColor: CustomColors.blue,
                    backgroundImage: AssetImage(player2.image),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
