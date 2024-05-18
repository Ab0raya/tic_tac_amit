import 'package:bloc/bloc.dart';

part 'add_names_state.dart';

class AddNamesCubit extends Cubit<AddNamesState> {
  String playerName1 = 'Player 1';
  String playerName2 = 'Player 2';
  setFirstPlayerName(String name){
    playerName1 = name;
  }setSecondPlayerName(String name){
    playerName2 = name;
  }
  AddNamesCubit() : super(AddNamesInitial());
}
