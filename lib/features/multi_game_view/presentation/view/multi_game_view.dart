import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../data/player_model.dart';
import 'widgets/multi_game_view_body.dart';

class MultiGameView extends StatelessWidget {
  const MultiGameView({super.key, required this.playersData});
  final List<Player> playersData;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColors.darkBlue,
      body: MultiGameViewBody(player1: playersData[0], player2:playersData[1],),
    );
  }
}
