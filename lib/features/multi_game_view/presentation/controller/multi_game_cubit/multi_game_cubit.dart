
import 'package:bloc/bloc.dart';

import 'multi_game_state.dart';


class MultiGameCubit extends Cubit<MultiGameState> {
  MultiGameCubit() : super(MultiGameInitial());

  void handleTap(int index) {
    final currentState = state;
    if (currentState is MultiGameUpdated || currentState is MultiGameInitial) {
      if (state.board[index].isEmpty) {
        final newBoard = List<String>.from(state.board);
        newBoard[index] = state.isXTurn ? 'X' : 'O';
        if (_checkWin(newBoard, state.isXTurn ? 'X' : 'O')) {
          emit(MultiGameWin(newBoard, state.isXTurn, state.isXTurn ? 'X' : 'O'));
        } else if (newBoard.every((cell) => cell.isNotEmpty)) {
          emit(MultiGameDraw(newBoard));
        } else {
          emit(MultiGameUpdated(newBoard, !state.isXTurn));
        }
      }
    }
  }

  bool _checkWin(List<String> board, String player) {
    const List<List<int>> winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var positions in winningPositions) {
      if (positions.every((index) => board[index] == player)) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    emit(MultiGameInitial());
  }
}
