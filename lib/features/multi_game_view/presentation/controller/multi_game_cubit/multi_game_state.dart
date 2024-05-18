import 'package:meta/meta.dart';

@immutable
abstract class MultiGameState {
  final List<String> board;
  final bool isXTurn;

  const MultiGameState(this.board, this.isXTurn);
}

class MultiGameInitial extends MultiGameState {
  MultiGameInitial() : super(List.generate(9, (index) => ''), true);
}

class MultiGameUpdated extends MultiGameState {
  const MultiGameUpdated(List<String> board, bool isXTurn)
      : super(board, isXTurn);
}

class MultiGameWin extends MultiGameState {
  final String winner;

  const MultiGameWin(List<String> board, bool isXTurn, this.winner)
      : super(board, isXTurn);
}

class MultiGameDraw extends MultiGameState {
  const MultiGameDraw(List<String> board)
      : super(board, true);
}
