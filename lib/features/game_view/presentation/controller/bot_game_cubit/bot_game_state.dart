class GameState {
  final List<String> board;
  final bool isXTurn;
  final String winner;
  final bool isGameOver;
  final int level;

  GameState({
    required this.board,
    required this.isXTurn,
    required this.winner,
    required this.isGameOver,
    required this.level,
  });

  factory GameState.initial(int level) {
    return GameState(
      board: List.filled(9, ''),
      isXTurn: true,
      winner: '',
      isGameOver: false,
      level: level,
    );
  }

  GameState copyWith({
    List<String>? board,
    bool? isXTurn,
    String? winner,
    bool? isGameOver,
    int? level,
  }) {
    return GameState(
      board: board ?? this.board,
      isXTurn: isXTurn ?? this.isXTurn,
      winner: winner ?? this.winner,
      isGameOver: isGameOver ?? this.isGameOver,
      level: level ?? this.level,
    );
  }
}
