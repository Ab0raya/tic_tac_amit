import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../controller/bot_game_cubit/bot_game_cubit.dart';

Row botSideTools(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MaterialButton(
        shape: const CircleBorder(),
        minWidth: 20,
        height: 55,
        color: CustomColors.yellow,
        onPressed: () {
          context.go(AppRouter.homeViewPath);
        },
        child: const Icon(
          Icons.home,
          color: CustomColors.blue,
          size: 40,
        ),
      ),
      MaterialButton(
        shape: const CircleBorder(),
        minWidth: 20,
        height: 55,
        color: CustomColors.yellow,
        onPressed: () {
          BlocProvider.of<GameCubit>(context).resetGame();
        },
        child: const Icon(
          Icons.refresh,
          color: CustomColors.blue,
          size: 40,
        ),
      ),
    ],
  );
}
