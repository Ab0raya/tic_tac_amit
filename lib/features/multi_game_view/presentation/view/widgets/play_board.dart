import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants/media_query.dart';
import '../../controller/multi_game_cubit/multi_game_cubit.dart';
import '../../controller/multi_game_cubit/multi_game_state.dart';

class PlayBoard extends StatelessWidget {
  const PlayBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenHeight(context),
      height: screenHeight(context) * 0.45,
      child: BlocBuilder<MultiGameCubit, MultiGameState>(
        builder: (context, state) {
          List<String> board = [];
          if (state is MultiGameUpdated || state is MultiGameWin || state is MultiGameDraw) {
            board = (state as dynamic).board;  // Handle all states
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<MultiGameCubit>().handleTap(index);
                },
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
                      board.isNotEmpty ? board[index] : '',
                      style: TextStyle(
                        fontSize: 48,
                        color: board.isNotEmpty
                            ? board[index] == 'X'
                            ? Colors.yellow
                            : Colors.blue
                            : Colors.black,
                      ),
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
