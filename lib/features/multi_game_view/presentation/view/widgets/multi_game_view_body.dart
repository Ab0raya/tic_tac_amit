import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac/core/utils/assets_paths.dart';
import 'package:tic_tac/features/multi_game_view/presentation/view/widgets/multi_result_dialog.dart';
import 'package:tic_tac/features/multi_game_view/presentation/view/widgets/multi_score_board.dart';
import 'package:tic_tac/features/multi_game_view/presentation/view/widgets/play_board.dart';
import '../../../../home_view/presentation/views/widgets/background_image.dart';
import '../../../data/player_model.dart';
import '../../controller/multi_game_cubit/multi_game_cubit.dart';

class MultiGameViewBody extends StatelessWidget {
  const MultiGameViewBody({Key? key, required this.player1, required this.player2})
      : super(key: key);
  final Player player1;
  final Player player2;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MultiGameCubit(),
      child: BackgroundImage(
        image: Images.background2,
        child: SafeArea(
          child: BlocListener<MultiGameCubit, MultiGameState>(
            listener: (context, state) {
              if (state is MultiGameWin) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return buildAlertDialog(context, state, dialogContext,'${state.winner} Wins!');
                  },
                );
              } else if (state is MultiGameDraw) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return buildAlertDialog(context, state, dialogContext,'Draw');
                  },
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MultiScoreBoard(player1: player1, player2: player2),
                 const PlayBoard(),
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

