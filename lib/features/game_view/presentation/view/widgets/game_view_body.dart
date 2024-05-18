import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac/core/utils/assets_paths.dart';
import 'package:tic_tac/features/game_view/presentation/view/widgets/result_dialog.dart';

import '../../../../home_view/presentation/views/widgets/background_image.dart';
import '../../controller/bot_game_cubit/bot_game_cubit.dart';
import '../../controller/bot_game_cubit/bot_game_state.dart';
import 'bot_game_score_board.dart';
import 'multi_game_board.dart';

class GameViewBody extends StatelessWidget {
  final int initialLevel;

  const GameViewBody({Key? key, required this.initialLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameCubit(initialLevel),
      child: BackgroundImage(
        image: Images.background2,
        child: SafeArea(
          child: BlocListener<GameCubit, GameState>(
            listener: (context, state) {
              if (state.isGameOver) {
                showDialog(
                  context: context,
                  builder: (dialogContext) => buildAlertDialog(
                    context,
                    state,
                    dialogContext,
                    state.winner == 'Draw' ? 'It\'s a Draw!' : '${state.winner} Wins!',
                  ),
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BotGameScoreBoard(),
                const MultiGameBoard(),

                Image.asset(
                  Images.logo,
                  width: 195,
                  height: 195,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

