import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac/constants/spacing.dart';
import 'package:tic_tac/core/utils/app_router.dart';
import 'package:tic_tac/core/utils/assets_paths.dart';
import 'package:tic_tac/features/multi_game_view/data/player_model.dart';

import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../controller/add_names_cubit/add_names_cubit.dart';
import 'custom_text_field.dart';

friendDialogue({required context, required String title}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CustomColors.yellow,
        content: BlocBuilder<AddNamesCubit, AddNamesState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              width: screenWidth(context) * 0.8,
              height: screenHeight(context) * 0.29,
              child: Column(
                children: [
                  Text(
                    title,
                    style: Styles.textStyle24,
                  ),
                  (screenHeight(context) * 0.02).sh,
                  CustomTextField(
                    hintText: 'Player 1',
                    onChanged: (val) {
                     BlocProvider.of<AddNamesCubit>(context).setFirstPlayerName(val);
                    },
                  ),
                  (screenHeight(context) * 0.01).sh,
                  CustomTextField(
                    hintText: 'Player 2',
                    onChanged: (val) {
                      BlocProvider.of<AddNamesCubit>(context).setSecondPlayerName(val);
                    },
                  ),
                  (screenHeight(context) * 0.025).sh,
                  MaterialButton(
                    height: screenHeight(context) * 0.05,
                    minWidth: screenWidth(context) * 0.2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      context.go(AppRouter.multiGameViewPath, extra: [
                        Player(name: BlocProvider.of<AddNamesCubit>(context).playerName1, image: Images.player1),
                        Player(name: BlocProvider.of<AddNamesCubit>(context).playerName2, image: Images.player2)
                      ]);
                    },
                    color: Colors.blueAccent,
                    child: Text(
                      'GO',
                      style: Styles.textStyle21
                          .copyWith(color: CustomColors.yellow),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
