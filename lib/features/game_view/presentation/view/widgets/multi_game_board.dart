import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/media_query.dart';
import '../../../../../core/utils/styles.dart';
import '../../controller/bot_game_cubit/bot_game_cubit.dart';
import '../../controller/bot_game_cubit/bot_game_state.dart';

class MultiGameBoard extends StatelessWidget {
  const MultiGameBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenHeight(context),
      height: screenHeight(context) * 0.45,
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.read<GameCubit>().playerMove(index),
                child: Container(
                  width: 127,
                  height: 127,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  margin: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      state.board[index],
                      style: Styles.textStyle40.copyWith(color:  state.board[index] == 'X'
                          ? Colors.yellow
                          : state.board[index] == 'O'
                          ? Colors.blue
                          : Colors.black,),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
