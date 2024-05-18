import 'package:go_router/go_router.dart';
import 'package:tic_tac/features/multi_game_view/data/player_model.dart';
import 'package:tic_tac/features/multi_game_view/presentation/view/multi_game_view.dart';

import '../../features/game_view/presentation/view/game_view.dart';
import '../../features/home_view/presentation/views/home_view.dart';


abstract class AppRouter{
  static String homeViewPath ='/HomeView';
  static String gameViewPath ='/GameView';
  static String multiGameViewPath ='/MultiGameView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ), GoRoute(
        path: homeViewPath,
       builder: (context, state) => const HomeView(),
      ), GoRoute(
        path: gameViewPath,
       builder: (context, state) =>  GameView(initialLevel: state.extra as int,),
      ),GoRoute(
        path: multiGameViewPath,
       builder: (context, state) =>  MultiGameView(playersData: state.extra as List<Player>),
      ),
    ],
  );
}