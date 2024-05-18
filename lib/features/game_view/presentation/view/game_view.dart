import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'widgets/game_view_body.dart';

class GameView extends StatelessWidget {
  const GameView({super.key, required this.initialLevel});
  final int initialLevel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColors.darkBlue,
      body: GameViewBody(initialLevel: initialLevel,),
    );
  }
}
