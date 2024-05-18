import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bot_game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(int initialLevel) : super(GameState.initial(initialLevel));

  void playerMove(int index) {
    if (state.board[index] == '' && state.isXTurn && !state.isGameOver) {
      final newBoard = List<String>.from(state.board);
      newBoard[index] = 'X';
      emit(state.copyWith(board: newBoard, isXTurn: false));
      _checkWinner();
      if (!state.isGameOver) {
        _botMove();
      }
    }
  }

  void _botMove() {
    if (state.isGameOver) return;

    if (state.level == 1) {
      _randomMove();
    } else {
      _strategicMove();
    }

    _checkWinner();
    if (!state.isGameOver) {
      emit(state.copyWith(isXTurn: true));
    }
  }

  void _randomMove() {
    List<int> emptyIndices = [];
    for (int i = 0; i < state.board.length; i++) {
      if (state.board[i] == '') emptyIndices.add(i);
    }
    if (emptyIndices.isNotEmpty) {
      int randomIndex = emptyIndices[Random().nextInt(emptyIndices.length)];
      final newBoard = List<String>.from(state.board);
      newBoard[randomIndex] = 'O';
      emit(state.copyWith(board: newBoard));
    }
  }

  void _strategicMove() {
    final newBoard = List<String>.from(state.board);
    bool moved = false;

    // Try to win
    for (int i = 0; i < newBoard.length; i++) {
      if (newBoard[i] == '') {
        newBoard[i] = 'O';
        if (_checkWinnerHelper(newBoard, 'O')) {
          emit(state.copyWith(board: newBoard));
          moved = true;
          break;
        }
        newBoard[i] = '';
      }
    }

    // Block the player
    if (!moved) {
      for (int i = 0; i < newBoard.length; i++) {
        if (newBoard[i] == '') {
          newBoard[i] = 'X';
          if (_checkWinnerHelper(newBoard, 'X')) {
            newBoard[i] = 'O';
            emit(state.copyWith(board: newBoard));
            moved = true;
            break;
          }
          newBoard[i] = '';
        }
      }
    }

    // Random move if no winning or blocking move found
    if (!moved) {
      _randomMove();
    }
  }

  void _checkWinner() {
    final winner = _findWinner(state.board);
    if (winner.isNotEmpty) {
      emit(state.copyWith(winner: winner, isGameOver: true));
    } else if (!state.board.contains('')) {
      emit(state.copyWith(winner: 'Draw', isGameOver: true));
    }
  }

  bool _checkWinnerHelper(List<String> board, String player) {
    return _findWinner(board) == player;
  }

  String _findWinner(List<String> board) {
    const List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      if (board[combination[0]] == board[combination[1]] &&
          board[combination[1]] == board[combination[2]] &&
          board[combination[0]] != '') {
        return board[combination[0]];
      }
    }
    return '';
  }

  void resetGame() {
    emit(GameState.initial(state.level));
  }

  void changeLevel(int newLevel) {
    emit(state.copyWith(level: newLevel));
  }

  void resetGameAndCloseDialog(BuildContext dialogContext) {
    emit(GameState.initial(state.level));
    Navigator.of(dialogContext).pop();
  }

  void resetGameAndCloseDialogForLevel2(BuildContext dialogContext) {
    Navigator.of(dialogContext).pop();
    emit(GameState.initial(state.level));
    Navigator.of(dialogContext).pop();
  }
}
