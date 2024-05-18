
part of 'multi_game_cubit.dart';

@immutable
abstract class MultiGameState {}

class MultiGameInitial extends MultiGameState {}

class MultiGameUpdated extends MultiGameState {
  final List<String> board;
  final String currentPlayer;

  MultiGameUpdated(this.board, this.currentPlayer);
}

class MultiGameWin extends MultiGameState {
  final List<String> board;
  final String winner;

  MultiGameWin(this.board, this.winner);
}

class MultiGameDraw extends MultiGameState {
  final List<String> board;

  MultiGameDraw(this.board);
}
