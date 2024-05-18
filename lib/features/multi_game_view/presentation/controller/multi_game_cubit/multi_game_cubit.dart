
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'multi_game_state.dart';

class MultiGameCubit extends Cubit<MultiGameState> {
  List<String> _board = List.generate(9, (index) => '');
  String _currentPlayer = 'X';

  MultiGameCubit() : super(MultiGameInitial());

  void handleTap(int index) {
    if (_board[index].isEmpty) {
      _board[index] = _currentPlayer;
      if (_checkWin(_currentPlayer)) {
        emit(MultiGameWin(_board, _currentPlayer));
      } else if (_board.every((cell) => cell.isNotEmpty)) {
        emit(MultiGameDraw(_board));
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
        emit(MultiGameUpdated(_board, _currentPlayer));
      }
    }
  }

  bool _checkWin(String player) {
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
      if (positions.every((index) => _board[index] == player)) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    _board = List.generate(9, (index) => '');
    _currentPlayer = 'X';
    emit(MultiGameUpdated(_board, _currentPlayer));
  }
}
