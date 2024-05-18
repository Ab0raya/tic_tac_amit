import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac/constants/spacing.dart';
import 'package:tic_tac/core/utils/app_router.dart';
import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home_view/presentation/views/widgets/custom_outlined_button.dart';
import '../../controller/bot_game_cubit/bot_game_cubit.dart';
import '../../controller/bot_game_cubit/bot_game_state.dart';

AlertDialog buildAlertDialog(BuildContext context, GameState state, BuildContext dialogContext, String msg) {
  return AlertDialog(
    backgroundColor: CustomColors.yellow,
    content: Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: screenWidth(context) * 0.8,
      height: screenHeight(context) * 0.17,
      child: Column(
        children: [
          Text(
            msg,
            style: Styles.textStyle24,
          ),
          (screenHeight(context) * 0.02).sh,
          CustomOutlinedButton(
            text: 'Play Again',
            onTap: () {
              if (state.level == 2) {
                context.read<GameCubit>().resetGameAndCloseDialogForLevel2(dialogContext);
              } else {
                context.read<GameCubit>().resetGameAndCloseDialog(dialogContext);
              }
            },
          ),
          CustomOutlinedButton(
            text: 'Home',
            onTap: () {
              context.go(AppRouter.homeViewPath);
            },
          ),
        ],
      ),
    ),
  );
}
